require 'journeylog'

describe JourneyLog do
  let(:station) { double(:station) }
  let(:journey) { double(:journey, set_exit_station: station, set_entry_station: station) }
  let(:mock_journey_class) { double(:mock_journey_class, new: journey) }
  subject(:journey_log) { described_class.new(mock_journey_class) }


  describe '#initialize' do
    it 'should be an instance of journeylog class' do
      expect(subject).to be_an_instance_of(JourneyLog)
    end
  end
    it "should be the class Journey" do
    expect(subject.journey_class).to eq(mock_journey_class)
  end

  describe '#start' do
    it 'should start journey with an entry station' do
      expect(subject.start(station)).to eq(station)
    end
    it "should accept one argument" do
      expect(subject).to respond_to(:start).with(1).argument
    end
  end
  describe ' #finish' do
    it 'should accept 1 argument' do
      expect(subject).to respond_to(:finish).with(1).argument
    end
    it "should set journey exit station" do
      subject.start(station)
      expect(subject.finish(station)).to eq(station)
    end
  end

end

















# require 'journeylog'
#
# describe JourneyLog do
#   let(:journey) { double(:journey) }
#   let(:journey_class) { double(:journey_class, :new => journey) }
#   let(:station) { double(:station) }
#   subject { described_class.new(journey_class) }
#
#   describe "#initialize" do
#     it "should return an instance of JourneyLog" do
#       expect(subject).to be_an_instance_of(JourneyLog)
#     end
#     it "creates an empty journey_history" do
#       expect(subject.journey_history).to be_a(Array)
#         .and be_empty
#     end
#     context "when creating new journey_log" do
#       subject { described_class }
#
#       it "takes one arg upon instantiation" do
#         is_expected.to respond_to(:new).with(1).arguments
#       end
#     end
#   end
#
#   describe '#start' do
#     it 'creates a new Journey' do
#       expect(subject.start(station)).to eq(journey)
#     end
#   end
#
# end
