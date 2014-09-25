module SharedSnippet
  include Spinach::DSL

  And 'I have public "Personal snippet one" snippet' do
    create(:personal_snippet,
           title: "Personal snippet one",
           content: "Test content",
           file_name: "snippet.rb",
           private: false,
           author: current_user)
  end

  And 'I have private "Personal snippet private" snippet' do
    create(:personal_snippet,
           title: "Personal snippet private",
           content: "Provate content",
           file_name: "private_snippet.rb",
           private: true,
           author: current_user)
  end
  And 'I have a public many lined snippet' do
    create(:personal_snippet,
           title: 'Many lined snippet',
           content: <<-END.gsub(/^\s+\|/, ''),
             |line one
             |line two
             |line three
             |line four
             |line five
             |line six
             |line seven
             |line eight
             |line nine
             |line ten
             |line eleven
             |line twelve
             |line thirteen
             |line fourteen
           END
           file_name: 'many_lined_snippet.rb',
           private: true,
           author: current_user)
  end
end
