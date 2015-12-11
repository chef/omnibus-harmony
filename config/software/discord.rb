#
# Copyright 2015 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This software definition installs dummy project called 'discord' which consists
# of a simple makefile and C program to aid in debugging Omnibus packaging, file
# handling issues. Discord's makefile also creates hardlinks.

name "discord"
default_version "0.0.4"

dependency "zlib"

version("0.0.1") { source md5: "f16120be63e9c8c7597d3f30a5c2dd40" }
version("0.0.2") { source md5: "58c54b48517a8359f219e926f89f39e7" }
version("0.0.3") { source md5: "beb362dd00d36b983e59b1c6c0f4e41f" }
version("0.0.4") { source md5: "b06320d54c8fe565532aa6be883cca1f" }

source url: "https://chef-releng.s3.amazonaws.com/discord/discord-#{version}.tar.gz"

relative_path "discord-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  env['PREFIX'] = "#{install_dir}/embedded"

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
