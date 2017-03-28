require "danger/commands/runner"
require "danger/danger_core/executor"

RSpec.describe Danger::Runner do
  context "without Dangerfile" do
    it "raises error" do
      argv = CLAide::ARGV.new([])

      Dir.mktmpdir do |dir|
        Dir.chdir dir do
          runner = described_class.new(argv)
          expect { runner.validate! }.to raise_error(StandardError, /Could not find a Dangerfile./)
        end
      end
    end
  end

  context "default options" do
    it "sets instance variables accrodingly" do
      argv = CLAide::ARGV.new([])

      runner = described_class.new(argv)
      ui = runner.instance_variable_get(:"@cork")

      expect(runner).to have_instance_variables(
        "@dangerfile_path" => "Dangerfile",
        "@base" => nil,
        "@head" => nil,
        "@fail_on_errors" => false,
        "@danger_id" => "danger",
        "@new_comment" => nil
      )
      expect(ui).to be_a Cork::Board
      expect(ui).to have_instance_variables(
        "@silent" => false,
        "@verbose" => false
      )
    end
  end

  describe "#run" do
    it "invokes Executor" do
      argv = CLAide::ARGV.new([])
      runner = described_class.new(argv)
      executor = double("Executor")

      expect(Danger::Executor).to receive(:new) { executor }
      expect(executor).to receive(:run).with(
        base: nil,
        head: nil,
        dangerfile_path: "Dangerfile",
        danger_id: "danger",
        new_comment: nil,
        fail_on_errors: false
      )

      runner.run
    end

    context "with custom CLI options passed in" do
      before { IO.write("MyDangerfile", "") }

      it "overrides default options" do
        argv = CLAide::ARGV.new(
          [
            "--base=my-base",
            "--head=my-head",
            "--dangerfile=MyDangerfile",
            "--danger_id=my-danger-id",
            "--new-comment",
            "--fail-on-errors=true"
          ]
        )
        runner = described_class.new(argv)
        executor = double("Executor")

        expect(Danger::Executor).to receive(:new) { executor }
        expect(executor).to receive(:run).with(
          base: "my-base",
          head: "my-head",
          dangerfile_path: "MyDangerfile",
          danger_id: "my-danger-id",
          new_comment: true,
          fail_on_errors: "true"
        )

        runner.run
      end

      after { FileUtils.rm("MyDangerfile") }
    end
  end
end
