if [ ! -n "$WERCKER_LOGGLY_CHECK_USERNAME" ]; then
  error 'Please specify username property'
  exit 1
fi

if [ ! -n "$WERCKER_LOGGLY_CHECK_PASSWORD" ]; then
  error 'Please specify password property'
  exit 1
fi

if [ ! -n "$WERCKER_LOGGLY_CHECK_SUBDOMAIN" ]; then
  error 'Please specify subdomain property'
  exit 1
fi

if [ ! -n "$WERCKER_LOGGLY_CHECK_QUERY" ]; then
  error 'Please specify query property'
  exit 1
fi
if [ ! -n "$WERCKER_LOGGLY_CHECK_FROM" ]; then
  error 'Please specify from property'
  exit 1
fi

cd "$WERCKER_STEP_ROOT"
echo "do loggly search"
echo "https://$WERCKER_LOGGLY_CHECK_SUBDOMAIN.loggly.com/api/search?q=$WERCKER_LOGGLY_CHECK_QUERY&from=$WERCKER_LOGGLY_CHECK_FROM"
curl --user $WERCKER_LOGGLY_CHECK_USERNAME:$WERCKER_LOGGLY_CHECK_PASSWORD https://$WERCKER_LOGGLY_CHECK_SUBDOMAIN.loggly.com/api/search\?q\=$WERCKER_LOGGLY_CHECK_QUERY\&from\=$WERCKER_LOGGLY_CHECK_FROM > $WERCKER_STEP_TEMP/report.json
echo "result"
cat $WERCKER_STEP_TEMP/report.json
python main.py $WERCKER_STEP_TEMP/report.json
