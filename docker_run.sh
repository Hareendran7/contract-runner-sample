if docker rm -f integrationtests || true; then
  docker run --name integrationtests -e RESOURCES_PATH='/var/inttests/resources' -v `pwd`:/var/inttests/resources athukorala/integration-test-runner:0.0.1
  docker logs -f integrationtests

  if [ "$(docker wait integrationtests)" -ne "0" ] ; then
    echo "There are test failures"
  fi
fi