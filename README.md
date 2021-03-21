`cue vet ./fsquare.schema.cue ./20210301_0_50.json`
`cue export -e to_yaml --out=text ./fsquare.to_yaml.cue ./data-src/fsquare/20210301_0_50.json > ./data-dst/fsquare/20210301_0_50.yaml`
