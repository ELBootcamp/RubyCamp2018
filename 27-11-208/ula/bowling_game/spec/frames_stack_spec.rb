require_relative '../lib/frames_stack'

RSpec.describe FramesStack do
  it 'does not allow to add more than 10 frames per game' do
    10.times { subject.add_new_frame(Frame.new) }

    expect { subject.add_new_frame(Frame.new) }.to raise_error(FramesCountExceeded)
  end

  it 'returns overall score for all passed frames' do
    prepare_frames_stack([[1, 4], [4, 4]])

    expect(subject.overall_score).to eq(13)
  end

  it 'handles strike' do
    prepare_frames_stack([[1, 4], [4, 4]])

    expect(subject.overall_score).to eq(13)
  end

  it 'returns proper position of frame' do
    prepare_frames_stack([[1, 4], [4, 4]])

    frame = prepare_frame([5, 2])
    subject.add_new_frame(frame)

    expect(subject.position_of(frame)).to eq(3)
  end

  it 'returns nil when passed frame don\t exist in frame' do
    prepare_frames_stack([[1, 4], [4, 4]])

    frame = prepare_frame([2, 3])

    expect(subject.position_of(frame)).to eq(nil)
  end

  private

  def prepare_frames_stack(frames_values)
    frames_values.each do |frame_value|
      frame = prepare_frame(frame_value)

      subject.add_new_frame(frame)
    end
  end

  def prepare_frame(frame_value)
    frame = Frame.new
    frame.add_first_knock(frame_value[0])
    frame.add_second_knock(frame_value[1])
  end
end
