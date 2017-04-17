function watch {
  watchman-make -p '**/*.rst' '**/*.md' '**/*.proto' 'conf.py' --t html
}

function serve {
  pushd _build/html; python -m SimpleHTTPServer; popd
}

make html
serve & watch