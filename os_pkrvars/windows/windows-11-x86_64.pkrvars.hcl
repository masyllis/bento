os_name    = "windows"
os_version = "11"
os_arch    = "x86_64"
is_windows = true
iso_url = "https://software-static.download.prss.microsoft.com/dbazure/988969d5-f34g-4e03-ac9d-1f9786c66751/22621.525.220925-0207.ni_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
iso_checksum            = "sha256:ebbc79106715f44f5020f77bd90721b17c5a877cbc15a3535b99155493a1bb3f"
parallels_guest_os_type = "win-11"
vbox_guest_os_type      = "Windows11_64"
vmware_guest_os_type    = "windows9srv-64"
boot_command            = ["<wait><leftShiftOn><f10><leftShiftOff><wait>reg add HKLM\\SYSTEM\\Setup\\LabConfig /t REG_DWORD /v BypassTPMCheck /d 1<return>reg add HKLM\\SYSTEM\\Setup\\LabConfig /t REG_DWORD /v BypassSecureBootCheck /d 1<return><wait>exit<return><wait><return>"]
cpus = 4
memory = 8192
vmware_vmx_data = {
    "cpuid.coresPerSocket"    = "4"
    "ethernet0.pciSlotNumber" = "32"
    "virtualhw.version" = "19"
}
