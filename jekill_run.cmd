echo off

set HOME=%cd%
set PAGES_REPO_NWO=oleg-shilo/oleg-shilo.github.io

echo source "https://rubygems.org" > Gemfile
echo gem "github-pages", group: :jekyll_plugins >> Gemfile

bundle exec jekyll serve