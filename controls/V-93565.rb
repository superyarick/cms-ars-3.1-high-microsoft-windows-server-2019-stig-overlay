# encoding: UTF-8

include_controls 'microsoft-windows-server-2019-stig-baseline' do
  control "V-93565" do
    desc  "fix", "Ensure Exploit Protection system-level mitigation, \"Randomize memory allocations (Bottom-Up ASLR)\" is turned on. The default configuration in Exploit Protection is \"On by default\" which meets this requirement.
      Open \"Windows Defender Security Center\".
      Select \"App & browser control\".
      Select \"Exploit protection settings\".
      Under \"System settings\", configure \"Randomize memory allocations
      (Bottom-Up ASLR)\" to \"On by default\" or \"Use default (<On>)\"."
  end
end