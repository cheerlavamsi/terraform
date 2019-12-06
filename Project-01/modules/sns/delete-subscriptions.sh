#!/bin/bash

SUBS_LIST=$(aws sns list-subscriptions-by-topic --topic-arn $1 | grep SubscriptionArn | awk '{print $2}' |xargs )

for subscription in ${SUBS_LIST} ; do
  aws sns unsubscribe --subscription-arn $subscription
done
