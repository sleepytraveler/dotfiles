# Setup keychain for all fish shells
eval (keychain --eval --agents ssh --quiet ~/.ssh/fxr-simics-key/id_rsa)
eval (keychain --eval --agents ssh --quiet ~/.ssh/vrkonda-desk-key/id_rsa)
