set -e

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# sometimes, directly copied folder cause some wierd issues
# this fixes that
cp -R /app $COPIED_APP_PATH
cd $COPIED_APP_PATH

npm i --unsafe-perm
meteor build --directory $BUNDLE_DIR --server=http://localhost:3000 --unsafe-perm

cd $BUNDLE_DIR/bundle/programs/server/
npm i --unsafe-perm

mv $BUNDLE_DIR/bundle /built_app

# cleanup
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR
rm -rf ~/.meteor
rm /usr/local/bin/meteor