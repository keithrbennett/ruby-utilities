#!/usr/bin/ruby

if ARGV.length != 2
  puts "Syntax is create-web-pom domain_name package_name"
  exit -1
end

DOMAIN_NAME = ARGV[0]
PACKAGE_NAME = ARGV[1]

puts """
Domain: #{DOMAIN_NAME}
Package: #{PACKAGE_NAME}

"""

puts `mvn archetype:create -DgroupId=#{DOMAIN_NAME} \
                            -DartifactId=simple-webapp \
                            -DpackageName=#{DOMAIN_NAME}.#{PACKAGE_NAME}
                            -DarchetypeArtifactId=maven-archetype-webapp`
