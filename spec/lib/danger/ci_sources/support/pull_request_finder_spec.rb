require "danger/ci_source/support/pull_request_finder"

RSpec.describe Danger::PullRequestFinder do
  def finder(pull_request_id: "", logs: nil, repo_slug: "danger/danger", remote: "false")
    described_class.new(
      pull_request_id,
      repo_slug,
      remote: remote,
      git_logs: logs
    )
  end

  def merge_pull_request_log
    IO.read("spec/fixtures/ci_source/support/danger-git.log")
  end

  def squash_and_merge_log
    IO.read("spec/fixtures/ci_source/support/swiftweekly.github.io-git.log")
  end

  def two_kinds_of_merge_log
    IO.read("spec/fixtures/ci_source/support/two-kinds-of-merge-both-present.log")
  end

  def open_pull_requests_info
    require "ostruct"
    JSON.parse(
      IO.read("spec/fixtures/ci_source/support/danger_danger_pr_518.json"),
      object_class: OpenStruct
    )
  end

  describe "#new" do
    it "translates $remote into boolean" do
      expect(finder(remote: "true")).to have_instance_variables(
        "@remote" => true
      )
    end
  end

  describe "#call" do
    context "not specified Pull Request ID" do
      context "merge pull request type Pull Request" do
        it "returns correct Pull Request ID and SHA1" do
          result = finder(logs: merge_pull_request_log).call

          expect(result.pull_request_id).to eq "557"
          expect(result.sha).to eq "bde9ea7"
        end
      end

      context "squash and merge type Pull Request" do
        it "returns correct Pull Request ID and SHA1" do
          result = finder(logs: squash_and_merge_log).call

          expect(result.pull_request_id).to eq "89"
          expect(result.sha).to eq "129045f"
        end
      end
    end

    context "specify Pull Request ID" do
      context "merge pull request type Pull Request" do
        it "returns correct Pull Request ID and SHA1" do
          result = finder(pull_request_id: "556", logs: merge_pull_request_log).call

          expect(result.pull_request_id).to eq "556"
          expect(result.sha).to eq "0cd9198"
        end
      end

      context "squash and merge type Pull Request" do
        it "returns correct Pull Request ID and SHA1" do
          result = finder(pull_request_id: "77", logs: squash_and_merge_log).call

          expect(result.pull_request_id).to eq "77"
          expect(result.sha).to eq "3f7047a"
        end
      end
    end

    context "merged and squash-and-merged both present" do
      it "returns the most recent one" do
        result = finder(pull_request_id: "2", logs: two_kinds_of_merge_log).call

        expect(result.pull_request_id).to eq "2"
        expect(result.sha).to eq "9f8c75a"
      end
    end

    context "with open Pull Request" do
      it "returns the opened Pull Request info" do
        client = double("Octokit::Client")
        allow(Octokit::Client).to receive(:new) { client }
        allow(client).to receive(:pull_request).with("danger/danger", "518") do
          open_pull_requests_info
        end

        result = finder(pull_request_id: "518", logs: "not important here", remote: "true").call

        expect(result.pull_request_id).to eq "518"
        expect(result.head).to eq "pr 518 head commit sha1"
        expect(result.base).to eq "pr 518 base commit sha1"
      end
    end
  end
end
