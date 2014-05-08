# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

vendor_path = vendor/google

#system
PRODUCT_COPY_FILES += $(shell test -d $(vendor_path)/system && \
	  find $(vendor_path)/system -type f \
	  -printf '%p:system/%P\n')

PRODUCT_COPY_FILES += $(shell test -d $(vendor_path)/etc && \
	  find $(vendor_path)/etc -type f \
	  -printf '%p:etc/%P\n')

PRODUCT_COPY_FILES += $(shell test -d $(vendor_path)/framework && \
	  find $(vendor_path)/framework -type f \
	  -printf '%p:framework/%P\n')