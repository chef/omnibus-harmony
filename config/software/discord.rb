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
default_version "0.0.8"

license :project_license

dependency "zlib"

version("0.0.1") { source md5: "f16120be63e9c8c7597d3f30a5c2dd40" }
version("0.0.2") { source md5: "58c54b48517a8359f219e926f89f39e7" }
version("0.0.5") { source md5: "d8993994f54f624c830518c483ac43f9" }
version("0.0.6") { source md5: "37eff013cdd48f16eb51061513593cb3" }
version("0.0.7") { source md5: "9a314b69fb7a41fa3692553fbb071872" }
version("0.0.8") { source md5: "984cf3016820dac7b2e4a8804d01e4ac" }

source url: "https://chef-releng.s3.amazonaws.com/discord/discord-#{version}.tar.gz"

relative_path "discord-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  env['PREFIX'] = "#{install_dir}/embedded"

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
