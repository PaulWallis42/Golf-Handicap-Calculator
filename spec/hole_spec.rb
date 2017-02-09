describe Hole do

  it 'can save a new hole to the database' do
    Hole.create(par: 5, si: 15, distance: 520, putts: 3, shots: 6)
    hole = Hole.first
    expect(hole.par).to eq(5)
    expect(hole.si).to eq(15)
    expect(hole.distance).to eq(520)
    expect(hole.putts).to eq(3)
    expect(hole.shots).to eq(6)
  end

end
