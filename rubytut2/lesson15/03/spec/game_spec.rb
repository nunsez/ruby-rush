require 'game'

describe Game do
    it 'should be lose' do
        game = Game.new('загадка')
        %w[п о р а ж е н и е].each { game.next_step(_1) }
        expect(game.status == -1).to be true
        expect(game.errors).to eq 7
    end
end

describe Game.new('загадка') do
    it { is_expected.to have_attributes(status: 0) }

    it 'should be win' do
        %w[з а р d г д к].each { subject.next_step(_1) }
        expect(subject).to have_attributes(status: 1, errors: 2)
    end
end
