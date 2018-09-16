#/bin/sh -e

swiftformat . \
  --indent 2 \
  --commas inline \
  --disable unusedArguments \
  --exclude "Pods,Carthage,Frameworks,Products"
