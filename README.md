# Find product id in Windows registry

`Computer\HKEY_CLASSES_ROOT\Installer\Dependencies

Select name then Default key

or

get product id first from

Computer\HKEY_CLASSES_ROOT\Installer\Products

for example: SQL 2016

CB138EA08A2F2ED4F8FB862B0216A1F7

Microsoft SQL Server 2016 Setup (English)

Then find Uninstallstring

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\<product code>\InstallProperties\UninstallString

MsiExec.exe /X{0AE831BC-F2A8-4DE2-8FBF-68B220611A7F}    -<< product code

product code: {0AE831BC-F2A8-4DE2-8FBF-68B220611A7F}`

# How to Install VMware Automation SDK Python on Tower Node

login to Tower with root credentials

`source /var/lib/awx/venv/ansible/bin/activate`

`cd /tmp`

`git clone https://github.com/vmware/vsphere-automation-sdk-python.git`

`cd vsphere-automation-sdk-python`

if using python3:

`pip3 install --upgrade -r requirements.txt --extra-index-url file:///tmp/vsphere_automation_sdk/vsphere-automation-sdk-python-master/lib`

`pip3 install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git`

if using python2:

`pip install --upgrade -r requirements.txt --extra-index-url file:///tmp/vsphere_automation_sdk/vsphere-automation-sdk-python-master/lib`

`pip install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git`



