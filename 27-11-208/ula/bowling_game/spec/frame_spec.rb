require_relative '../lib/frame'

RSpec.describe Frame do
  it 'can store only one knock in frame' do
    expect { subject.add_first_knock(5) }.to_not raise_error

    frame = subject.add_first_knock(5)

    expect(frame.first_knock).to eq(5)
    expect(frame.second_knock).to eq(nil)
  end

  it 'consists of two separate knocks that sum of which cannot be larger than 10' do
    frame = subject.add_first_knock(5)

    expect { frame.add_second_knock(15) }.to raise_error(ArgumentError)
  end

  it 'does store only one knock when all ten pins are being knocked at once' do
    frame = subject.add_first_knock(10)

    expect { frame.add_second_knock(2) }.to raise_error(ArgumentError)
  end
end
