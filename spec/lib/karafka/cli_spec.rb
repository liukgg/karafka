require 'spec_helper'

RSpec.describe Karafka::Cli do
  subject { described_class }

  describe '.prepare' do
    let(:command) { Karafka::Cli::Server }
    let(:commands) { [command] }

    it 'expect to use all Cli commands defined' do
      expect(command)
        .to receive(:bind_to)
        .with(subject)

      subject.prepare
    end
  end

  describe '.cli_commands' do
    let(:available_commands) do
      [
        Karafka::Cli::Console,
        Karafka::Cli::Info,
        Karafka::Cli::Install,
        Karafka::Cli::Routes,
        Karafka::Cli::Server,
        Karafka::Cli::Topics,
        Karafka::Cli::Worker
      ]
    end

    it 'expect to return all cli commands classes' do
      expect(subject.send(:cli_commands)).to eq available_commands
    end
  end
end
