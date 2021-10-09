require 'hashtags'

describe 'hashtags' do
    it 'returns single hashtag' do
        expect(hashtags('string with #one hashtag')).to eq %w[#one]
    end

    it 'returns multiple hashtags' do
        expect(hashtags('#string with #two hashtags')).to eq %w[#string #two]
    end

    it 'returns hastags with russian' do
        expect(hashtags('строка с #хештегом')).to eq %w[#хештегом]
    end

    it 'returns hastags with underscores' do
        expect(hashtags('string with underscore #hash_tag')).to eq %w[#hash_tag]
    end

    it 'returns hastags with minuses' do
        expect(hashtags('#hash--tag string with minuses')).to eq %w[#hash--tag]
    end

    it 'does not return question mark' do
        expect(hashtags('string #with? hashtag')).to eq %w[#with]
    end

    it 'does not return exclamation mark' do
        expect(hashtags('string #with! hashtag')).to eq %w[#with]
    end
end
