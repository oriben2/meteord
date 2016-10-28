set -e

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# sometimes, directly copied folder cause some wierd issues
# this fixes that
cp -R /app $COPIED_APP_PATH
cd $COPIED_APP_PATH

# npm i so all resources are available for the bundling
echo "=> npm install (pre-build)"
meteor npm install --unsafe-perm

echo "=> meteor build"
meteor build --directory $BUNDLE_DIR --server=http://localhost:3000 --unsafe-perm --server-only
mv $BUNDLE_DIR/bundle /built_app

# cleanup
echo "=> cleanup"
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR
rm -rf ~/.meteor
rm /usr/local/bin/meteor

# npm i on built app
echo "=> npm install (post build)"
cd /built_app/programs/server
npm i --unsafe-perm