require "spec_helper"

RSpec.describe PaperTrailNeo4j::Version do
  let(:instance) do
    described_class.new \
      object_id: SecureRandom.uuid,
      event: :created,
      object_changes: {
        name: "something",
      },
      object: SecureRandom.uuid,
      object_type: "SomeClass",
      transaction_id: SecureRandom.uuid,
      whodunnit: "bob-the-builder",
      metadata: {
        a: :b,
      },
      created_at: Time.now
  end

  subject { instance }

  it { is_expected.to be_a ActiveGraph::Node }

  its(:save) { is_expected.to be_truthy }
end
