def hashtags(string)
    hashtag_regexp = /#[[:word:]-]+/
    string.scan(hashtag_regexp)
end
