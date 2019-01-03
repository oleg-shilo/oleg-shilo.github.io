echo off
echo source "https://rubygems.org" > Gemfile
echo gem "github-pages", group: :jekyll_plugins >> Gemfile
echo off
bundle exec jekyll serve
pause