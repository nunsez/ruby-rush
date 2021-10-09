require 'rspec'

require_relative 'sklonjator'

DECLENSIONS = %w[krokodil krokodila krokodilov].freeze

describe Sklonjator do
    it 'should do OK for KROKODILOV' do
        expect(Sklonjator.sklonenie(0, *DECLENSIONS)).to eq 'krokodilov'
        expect(Sklonjator.sklonenie(5, *DECLENSIONS)).to eq 'krokodilov'
        expect(Sklonjator.sklonenie(6, *DECLENSIONS)).to eq 'krokodilov'
    end

    it 'should do OK for KROKODIL' do
        [1, 21, 31].each do |i|
            expect("#{i} #{Sklonjator.sklonenie(i, *DECLENSIONS)}").to eq "#{i} krokodil"
        end
    end

    it 'should do OK for KROKODILA' do
        [2, 3, 4, 22, 33].each do |i|
            expect("#{i} #{Sklonjator.sklonenie(i, *DECLENSIONS)}").to eq "#{i} krokodila"
        end
    end

    it 'should do OK for KROKODILOV - SPECIAL' do
        [10, 11, 12, 13, 14, 111, 312, 1013, 2414].each do |i|
            expect("#{i} #{Sklonjator.sklonenie(i, *DECLENSIONS)}").to eq "#{i} krokodilov"
        end
    end
end

describe 'Sklonjator with optional boolean' do
    it 'should print number if with_numbers = true' do
        expect(Sklonjator.sklonenie(5, *DECLENSIONS, true)).to eq '5 krokodilov'
    end

    it 'should not print number if with_numbers = false' do
        expect(Sklonjator.sklonenie(5, *DECLENSIONS, false)).to eq 'krokodilov'
    end
end
