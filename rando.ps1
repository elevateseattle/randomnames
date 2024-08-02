function Random-Thing {
    [Alias("rt")]
    [OutputType([string])]
    param ([switch]$FullPhrase, [switch]$XKCD)
    begin {
        $adjectives = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("YWJhbmRvbmVkIGFibGUgYWJzb2x1dGUgYWRvcmFibGUgYWR2ZW50dXJvdXMgYWNhZGVtaWMgYWNjZXB0YWJsZSBhY2NsYWltZWQgYWNjb21wbGlzaGVkIGFjY3VyYXRlIGFjaGluZyBhY2lkaWMgYWNyb2JhdGljIGFjdGl2ZSBhY3R1YWwgYWRlcHQgYWRtaXJhYmxlIGFkbWlyZWQgYWRvbGVzY2VudCBhZG9yYWJsZSBhZG9yZWQgYWR2YW5jZWQgYWZyYWlkIGFmZmVjdGlvbmF0ZSBhZ2VkIGFnZ3JhdmF0aW5nIGFnZ3Jlc3NpdmUgYWdpbGUgYWdpdGF0ZWQgYWdvbml6aW5nIGFncmVlYWJsZSBhamFyIGFsYXJtZWQgYWxhcm1pbmcgYWxlcnQgYWxpZW5hdGVkIGFsaXZlIGFsbCBhbHRydWlzdGljIGFtYXppbmcgYW1iaXRpb3VzIGFtcGxlIGFtdXNlZCBhbXVzaW5nIGFuY2hvcmVkIGFuY2llbnQgYW5nZWxpYyBhbmdyeSBhbmd1aXNoZWQgYW5pbWF0ZWQgYW5udWFsIGFub3RoZXIgYW50aXF1ZSBhbnhpb3VzIGFueSBhcHByZWhlbnNpdmUgYXBwcm9wcmlhdGUgYXB0IGFyY3RpYyBhcmlkIGFyb21hdGljIGFydGlzdGljIGFzaGFtZWQgYXNzdXJlZCBhc3RvbmlzaGluZyBhdGhsZXRpYyBhdHRhY2hlZCBhdHRlbnRpdmUgYXR0cmFjdGl2ZSBhdXN0ZXJlIGF1dGhlbnRpYyBhdXRob3JpemVkIGF1dG9tYXRpYyBhdmFyaWNpb3VzIGF2ZXJhZ2UgYXdhcmUgYXdlc29tZSBhd2Z1bCBhd2t3YXJkIGJhYnlpc2ggYmFkIGJhY2sgYmFnZ3kgYmFyZSBiYXJyZW4gYmFzaWMgYmVhdXRpZnVsIGJlbGF0ZWQgYmVsb3ZlZCBiZW5lZmljaWFsIGJldHRlciBiZXN0IGJld2l0Y2hlZCBiaWcgYmlnLWhlYXJ0ZWQgYmlvZGVncmFkYWJsZSBiaXRlLXNpemVkIGJpdHRlciBibGFjayBibGFjay1hbmQtd2hpdGUgYmxhbmQgYmxhbmsgYmxhcmluZyBibGVhayBibGluZCBibGlzc2Z1bCBibG9uZCBibHVlIGJsdXNoaW5nIGJvZ3VzIGJvaWxpbmcgYm9sZCBib255IGJvcmluZyBib3NzeSBib3RoIGJvdW5jeSBib3VudGlmdWwgYm93ZWQgYnJhdmUgYnJlYWthYmxlIGJyaWVmIGJyaWdodCBicmlsbGlhbnQgYnJpc2sgYnJva2VuIGJyb256ZSBicm93biBicnVpc2VkIGJ1YmJseSBidWxreSBidW1weSBidW95YW50IGJ1cmRlbnNvbWUgYnVybHkgYnVzdGxpbmcgYnVzeSBidXR0ZXJ5IGJ1enppbmcgY2FsY3VsYXRpbmcgY2FsbSBjYW5kaWQgY2FuaW5lIGNhcGl0YWwgY2FyZWZyZWUgY2FyZWZ1bCBjYXJlbGVzcyBjYXJpbmcgY2F1dGlvdXMgY2F2ZXJub3VzIGNlbGVicmF0ZWQgY2hhcm1pbmcgY2hlYXAgY2hlZXJmdWwgY2hlZXJ5IGNoaWVmIGNoaWxseSBjaHViYnkgY2lyY3VsYXIgY2xhc3NpYyBjbGVhbiBjbGVhciBjbGVhci1jdXQgY2xldmVyIGNsb3NlIGNsb3NlZCBjbG91ZHkgY2x1ZWxlc3MgY2x1bXN5IGNsdXR0ZXJlZCBjb2Fyc2UgY29sZCBjb2xvcmZ1bCBjb2xvcmxlc3MgY29sb3NzYWwgY29tZm9ydGFibGUgY29tbW9uIGNvbXBhc3Npb25hdGUgY29tcGV0ZW50IGNvbXBsZXRlIGNvbXBsZXggY29tcGxpY2F0ZWQgY29tcG9zZWQgY29uY2VybmVkIGNvbmNyZXRlIGNvbmZ1c2VkIGNvbnNjaW91cyBjb25zaWRlcmF0ZSBjb25zdGFudCBjb250ZW50IGNvbnZlbnRpb25hbCBjb29rZWQgY29vbCBjb29wZXJhdGl2ZSBjb29yZGluYXRlZCBjb3JueSBjb3JydXB0IGNvc3RseSBjb3VyYWdlb3VzIGNvdXJ0ZW91cyBjcmFmdHkgY3JhenkgY3JlYW15IGNyZWF0aXZlIGNyZWVweSBjcmltaW5hbCBjcmlzcCBjcml0aWNhbCBjcm9va2VkIGNyb3dkZWQgY3J1ZWwgY3J1c2hpbmcgY3VkZGx5IGN1bHRpdmF0ZWQgY3VsdHVyZWQgY3VtYmVyc29tZSBjdXJseSBjdXJ2eSBjdXRlIGN5bGluZHJpY2FsIGRhbWFnZWQgZGFtcCBkYW5nZXJvdXMgZGFwcGVyIGRhcmluZyBkYXJsaW5nIGRhcmsgZGF6emxpbmcgZGVhZCBkZWFkbHkgZGVhZmVuaW5nIGRlYXIgZGVhcmVzdCBkZWNlbnQgZGVjaW1hbCBkZWNpc2l2ZSBkZWVwIGRlZmVuc2VsZXNzIGRlZmVuc2l2ZSBkZWZpYW50IGRlZmljaWVudCBkZWZpbml0ZSBkZWZpbml0aXZlIGRlbGF5ZWQgZGVsZWN0YWJsZSBkZWxpY2lvdXMgZGVsaWdodGZ1bCBkZWxpcmlvdXMgZGVtYW5kaW5nIGRlbnNlIGRlbnRhbCBkZXBlbmRhYmxlIGRlcGVuZGVudCBkZXNjcmlwdGl2ZSBkZXNlcnRlZCBkZXRhaWxlZCBkZXRlcm1pbmVkIGRldm90ZWQgZGlmZmVyZW50IGRpZmZpY3VsdCBkaWdpdGFsIGRpbGlnZW50IGRpbSBkaW1wbGVkIGRpbXdpdHRlZCBkaXJlY3QgZGlzYXN0cm91cyBkaXNjcmV0ZSBkaXNmaWd1cmVkIGRpc2d1c3RpbmcgZGlzbG95YWwgZGlzbWFsIGRpc3RhbnQgZG93bnJpZ2h0IGRyZWFyeSBkaXJ0eSBkaXNndWlzZWQgZGlzaG9uZXN0IGRpc21hbCBkaXN0YW50IGRpc3RpbmN0IGRpc3RvcnRlZCBkaXp6eSBkb3BleSBkb3RpbmcgZG91YmxlIGRvd25yaWdodCBkcmFiIGRyYWZ0eSBkcmFtYXRpYyBkcmVhcnkgZHJvb3B5IGRyeSBkdWFsIGR1bGwgZHV0aWZ1bCBlYWNoIGVhZ2VyIGVhcm5lc3QgZWFybHkgZWFzeSBlYXN5LWdvaW5nIGVjc3RhdGljIGVkaWJsZSBlZHVjYXRlZCBlbGFib3JhdGUgZWxhc3RpYyBlbGF0ZWQgZWxkZXJseSBlbGVjdHJpYyBlbGVnYW50IGVsZW1lbnRhcnkgZWxsaXB0aWNhbCBlbWJhcnJhc3NlZCBlbWJlbGxpc2hlZCBlbWluZW50IGVtb3Rpb25hbCBlbXB0eSBlbmNoYW50ZWQgZW5jaGFudGluZyBlbmVyZ2V0aWMgZW5saWdodGVuZWQgZW5vcm1vdXMgZW5yYWdlZCBlbnRpcmUgZW52aW91cyBlcXVhbCBlcXVhdG9yaWFsIGVzc2VudGlhbCBlc3RlZW1lZCBldGhpY2FsIGV1cGhvcmljIGV2ZW4gZXZlcmdyZWVuIGV2ZXJsYXN0aW5nIGV2ZXJ5IGV2aWwgZXhhbHRlZCBleGNlbGxlbnQgZXhlbXBsYXJ5IGV4aGF1c3RlZCBleGNpdGFibGUgZXhjaXRlZCBleGNpdGluZyBleG90aWMgZXhwZW5zaXZlIGV4cGVyaWVuY2VkIGV4cGVydCBleHRyYW5lb3VzIGV4dHJvdmVydGVkIGV4dHJhLWxhcmdlIGV4dHJhLXNtYWxsIGZhYnVsb3VzIGZhaWxpbmcgZmFpbnQgZmFpciBmYWl0aGZ1bCBmYWtlIGZhbHNlIGZhbWlsaWFyIGZhbW91cyBmYW5jeSBmYW50YXN0aWMgZmFyIGZhcmF3YXkgZmFyLWZsdW5nIGZhci1vZmYgZmFzdCBmYXQgZmF0YWwgZmF0aGVybHkgZmF2b3JhYmxlIGZhdm9yaXRlIGZlYXJmdWwgZmVhcmxlc3MgZmVpc3R5IGZlbGluZSBmZW1hbGUgZmVtaW5pbmUgZmV3IGZpY2tsZSBmaWx0aHkgZmluZSBmaW5pc2hlZCBmaXJtIGZpcnN0IGZpcnN0aGFuZCBmaXR0aW5nIGZpeGVkIGZsYWt5IGZsYW1ib3lhbnQgZmxhc2h5IGZsYXQgZmxhd2VkIGZsYXdsZXNzIGZsaWNrZXJpbmcgZmxpbXN5IGZsaXBwYW50IGZsb3dlcnkgZmx1ZmZ5IGZsdWlkIGZsdXN0ZXJlZCBmb2N1c2VkIGZvbmQgZm9vbGhhcmR5IGZvb2xpc2ggZm9yY2VmdWwgZm9ya2VkIGZvcm1hbCBmb3JzYWtlbiBmb3J0aHJpZ2h0IGZvcnR1bmF0ZSBmcmFncmFudCBmcmFpbCBmcmFuayBmcmF5ZWQgZnJlZSBGcmVuY2ggZnJlc2ggZnJlcXVlbnQgZnJpZW5kbHkgZnJpZ2h0ZW5lZCBmcmlnaHRlbmluZyBmcmlnaWQgZnJpbGx5IGZyaXp6eSBmcml2b2xvdXMgZnJvbnQgZnJvc3R5IGZyb3plbiBmcnVnYWwgZnJ1aXRmdWwgZnVsbCBmdW1ibGluZyBmdW5jdGlvbmFsIGZ1bm55IGZ1c3N5IGZ1enp5IGdhcmdhbnR1YW4gZ2FzZW91cyBnZW5lcmFsIGdlbmVyb3VzIGdlbnRsZSBnZW51aW5lIGdpYW50IGdpZGR5IGdpZ2FudGljIGdpZnRlZCBnaXZpbmcgZ2xhbW9yb3VzIGdsYXJpbmcgZ2xhc3MgZ2xlYW1pbmcgZ2xlZWZ1bCBnbGlzdGVuaW5nIGdsaXR0ZXJpbmcgZ2xvb215IGdsb3Jpb3VzIGdsb3NzeSBnbHVtIGdvbGRlbiBnb29kIGdvb2QtbmF0dXJlZCBnb3JnZW91cyBncmFjZWZ1bCBncmFjaW91cyBncmFuZCBncmFuZGlvc2UgZ3JhbnVsYXIgZ3JhdGVmdWwgZ3JhdmUgZ3JheSBncmVhdCBncmVlZHkgZ3JlZW4gZ3JlZ2FyaW91cyBncmltIGdyaW15IGdyaXBwaW5nIGdyaXp6bGVkIGdyb3NzIGdyb3Rlc3F1ZSBncm91Y2h5IGdyb3VuZGVkIGdyb3dpbmcgZ3Jvd2xpbmcgZ3Jvd24gZ3J1YmJ5IGdydWVzb21lIGdydW1weSBndWlsdHkgZ3VsbGlibGUgZ3VtbXkgaGFpcnkgaGFsZiBoYW5kbWFkZSBoYW5kc29tZSBoYW5keSBoYXBweSBoYXBweS1nby1sdWNreSBoYXJkIGhhcmQtdG8tZmluZCBoYXJtZnVsIGhhcm1sZXNzIGhhcm1vbmlvdXMgaGFyc2ggaGFzdHkgaGF0ZWZ1bCBoYXVudGluZyBoZWFsdGh5IGhlYXJ0ZmVsdCBoZWFydHkgaGVhdmVubHkgaGVhdnkgaGVmdHkgaGVscGZ1bCBoZWxwbGVzcyBoaWRkZW4gaGlkZW91cyBoaWdoIGhpZ2gtbGV2ZWwgaGlsYXJpb3VzIGhvYXJzZSBob2xsb3cgaG9tZWx5IGhvbmVzdCBob25vcmFibGUgaG9ub3JlZCBob3BlZnVsIGhvcnJpYmxlIGhvc3BpdGFibGUgaG90IGh1Z2UgaHVtYmxlIGh1bWlsaWF0aW5nIGh1bW1pbmcgaHVtb25nb3VzIGh1bmdyeSBodXJ0ZnVsIGh1c2t5IGlja3kgaWN5IGlkZWFsIGlkZWFsaXN0aWMgaWRlbnRpY2FsIGlkbGUgaWRpb3RpYyBpZG9saXplZCBpZ25vcmFudCBpbGwgaWxsZWdhbCBpbGwtZmF0ZWQgaWxsLWluZm9ybWVkIGlsbGl0ZXJhdGUgaWxsdXN0cmlvdXMgaW1hZ2luYXJ5IGltYWdpbmF0aXZlIGltbWFjdWxhdGUgaW1tYXRlcmlhbCBpbW1lZGlhdGUgaW1tZW5zZSBpbXBhc3Npb25lZCBpbXBlY2NhYmxlIGltcGFydGlhbCBpbXBlcmZlY3QgaW1wZXJ0dXJiYWJsZSBpbXBpc2ggaW1wb2xpdGUgaW1wb3J0YW50IGltcG9zc2libGUgaW1wcmFjdGljYWwgaW1wcmVzc2lvbmFibGUgaW1wcmVzc2l2ZSBpbXByb2JhYmxlIGltcHVyZSBpbmJvcm4gaW5jb21wYXJhYmxlIGluY29tcGF0aWJsZSBpbmNvbXBsZXRlIGluY29uc2VxdWVudGlhbCBpbmNyZWRpYmxlIGluZGVsaWJsZSBpbmV4cGVyaWVuY2VkIGluZG9sZW50IGluZmFtb3VzIGluZmFudGlsZSBpbmZhdHVhdGVkIGluZmVyaW9yIGluZmluaXRlIGluZm9ybWFsIGlubm9jZW50IGluc2VjdXJlIGluc2lkaW91cyBpbnNpZ25pZmljYW50IGluc2lzdGVudCBpbnN0cnVjdGl2ZSBpbnN1YnN0YW50aWFsIGludGVsbGlnZW50IGludGVudCBpbnRlbnRpb25hbCBpbnRlcmVzdGluZyBpbnRlcm5hbCBpbnRlcm5hdGlvbmFsIGludHJlcGlkIGlyb25jbGFkIGlycmVzcG9uc2libGUgaXJyaXRhdGluZyBpdGNoeSBqYWRlZCBqYWdnZWQgamFtLXBhY2tlZCBqYXVudHkgamVhbG91cyBqaXR0ZXJ5IGpvaW50IGpvbGx5IGpvdmlhbCBqb3lmdWwgam95b3VzIGp1YmlsYW50IGp1ZGljaW91cyBqdWljeSBqdW1ibyBqdW5pb3IganVtcHkganV2ZW5pbGUga2FsZWlkb3Njb3BpYyBrZWVuIGtleSBraW5kIGtpbmRoZWFydGVkIGtpbmRseSBrbHV0enkga25vYmJ5IGtub3R0eSBrbm93bGVkZ2VhYmxlIGtub3dpbmcga25vd24ga29va3kga29zaGVyIGxhbWUgbGFua3kgbGFyZ2UgbGFzdCBsYXN0aW5nIGxhdGUgbGF2aXNoIGxhd2Z1bCBsYXp5IGxlYWRpbmcgbGVhbiBsZWFmeSBsZWZ0IGxlZ2FsIGxlZ2l0aW1hdGUgbGlnaHQgbGlnaHRoZWFydGVkIGxpa2FibGUgbGlrZWx5IGxpbWl0ZWQgbGltcCBsaW1waW5nIGxpbmVhciBsaW5lZCBsaXF1aWQgbGl0dGxlIGxpdmUgbGl2ZWx5IGxpdmlkIGxvYXRoc29tZSBsb25lIGxvbmVseSBsb25nIGxvbmctdGVybSBsb29zZSBsb3BzaWRlZCBsb3N0IGxvdWQgbG92YWJsZSBsb3ZlbHkgbG92aW5nIGxvdyBsb3lhbCBsdWNreSBsdW1iZXJpbmcgbHVtaW5vdXMgbHVtcHkgbHVzdHJvdXMgbHV4dXJpb3VzIG1hZCBtYWRlLXVwIG1hZ25pZmljZW50IG1hamVzdGljIG1ham9yIG1hbGUgbWFtbW90aCBtYXJyaWVkIG1hcnZlbG91cyBtYXNjdWxpbmUgbWFzc2l2ZSBtYXR1cmUgbWVhZ2VyIG1lYWx5IG1lYW4gbWVhc2x5IG1lYXR5IG1lZGljYWwgbWVkaW9jcmUgbWVkaXVtIG1lZWsgbWVsbG93IG1lbG9kaWMgbWVtb3JhYmxlIG1lbmFjaW5nIG1lcnJ5IG1lc3N5IG1ldGFsbGljIG1pbGQgbWlsa3kgbWluZGxlc3MgbWluaWF0dXJlIG1pbm9yIG1pbnR5IG1pc2VyYWJsZSBtaXNlcmx5IG1pc2d1aWRlZCBtaXN0eSBtaXhlZCBtb2Rlcm4gbW9kZXN0IG1vaXN0IG1vbnN0cm91cyBtb250aGx5IG1vbnVtZW50YWwgbW9yYWwgbW9ydGlmaWVkIG1vdGhlcmx5IG1vdGlvbmxlc3MgbW91bnRhaW5vdXMgbXVkZHkgbXVmZmxlZCBtdWx0aWNvbG9yZWQgbXVuZGFuZSBtdXJreSBtdXNoeSBtdXN0eSBtdXRlZCBteXN0ZXJpb3VzIG5haXZlIG5hcnJvdyBuYXN0eSBuYXR1cmFsIG5hdWdodHkgbmF1dGljYWwgbmVhciBuZWF0IG5lY2Vzc2FyeSBuZWVkeSBuZWdhdGl2ZSBuZWdsZWN0ZWQgbmVnbGlnaWJsZSBuZWlnaGJvcmluZyBuZXJ2b3VzIG5ldyBuZXh0IG5pY2UgbmlmdHkgbmltYmxlIG5pcHB5IG5vY3R1cm5hbCBub2lzeSBub25zdG9wIG5vcm1hbCBub3RhYmxlIG5vdGVkIG5vdGV3b3J0aHkgbm92ZWwgbm94aW91cyBudW1iIG51dHJpdGlvdXMgbnV0dHkgb2JlZGllbnQgb2Jlc2Ugb2Jsb25nIG9pbHkgb2Jsb25nIG9idmlvdXMgb2NjYXNpb25hbCBvZGQgb2RkYmFsbCBvZmZiZWF0IG9mZmVuc2l2ZSBvZmZpY2lhbCBvbGQgb2xkLWZhc2hpb25lZCBvbmx5IG9wZW4gb3B0aW1hbCBvcHRpbWlzdGljIG9wdWxlbnQgb3JhbmdlIG9yZGVybHkgb3JnYW5pYyBvcm5hdGUgb3JuZXJ5IG9yZGluYXJ5IG9yaWdpbmFsIG90aGVyIG91ciBvdXRseWluZyBvdXRnb2luZyBvdXRsYW5kaXNoIG91dHJhZ2VvdXMgb3V0c3RhbmRpbmcgb3ZhbCBvdmVyY29va2VkIG92ZXJkdWUgb3ZlcmpveWVkIG92ZXJsb29rZWQgcGFsYXRhYmxlIHBhbGUgcGFsdHJ5IHBhcmFsbGVsIHBhcmNoZWQgcGFydGlhbCBwYXNzaW9uYXRlIHBhc3QgcGFzdGVsIHBlYWNlZnVsIHBlcHBlcnkgcGVyZmVjdCBwZXJmdW1lZCBwZXJpb2RpYyBwZXJreSBwZXJzb25hbCBwZXJ0aW5lbnQgcGVza3kgcGVzc2ltaXN0aWMgcGV0dHkgcGhvbnkgcGh5c2ljYWwgcGllcmNpbmcgcGluayBwaXRpZnVsIHBsYWluIHBsYWludGl2ZSBwbGFzdGljIHBsYXlmdWwgcGxlYXNhbnQgcGxlYXNlZCBwbGVhc2luZyBwbHVtcCBwbHVzaCBwb2xpc2hlZCBwb2xpdGUgcG9saXRpY2FsIHBvaW50ZWQgcG9pbnRsZXNzIHBvaXNlZCBwb29yIHBvcHVsYXIgcG9ydGx5IHBvc2ggcG9zaXRpdmUgcG9zc2libGUgcG90YWJsZSBwb3dlcmZ1bCBwb3dlcmxlc3MgcHJhY3RpY2FsIHByZWNpb3VzIHByZXNlbnQgcHJlc3RpZ2lvdXMgcHJldHR5IHByZWNpb3VzIHByZXZpb3VzIHByaWNleSBwcmlja2x5IHByaW1hcnkgcHJpbWUgcHJpc3RpbmUgcHJpdmF0ZSBwcml6ZSBwcm9iYWJsZSBwcm9kdWN0aXZlIHByb2ZpdGFibGUgcHJvZnVzZSBwcm9wZXIgcHJvdWQgcHJ1ZGVudCBwdW5jdHVhbCBwdW5nZW50IHB1bnkgcHVyZSBwdXJwbGUgcHVzaHkgcHV0cmlkIHB1enpsZWQgcHV6emxpbmcgcXVhaW50IHF1YWxpZmllZCBxdWFycmVsc29tZSBxdWFydGVybHkgcXVlYXN5IHF1ZXJ1bG91cyBxdWVzdGlvbmFibGUgcXVpY2sgcXVpY2std2l0dGVkIHF1aWV0IHF1aW50ZXNzZW50aWFsIHF1aXJreSBxdWl4b3RpYyBxdWl6emljYWwgcmFkaWFudCByYWdnZWQgcmFwaWQgcmFyZSByYXNoIHJhdyByZWNlbnQgcmVja2xlc3MgcmVjdGFuZ3VsYXIgcmVhZHkgcmVhbCByZWFsaXN0aWMgcmVhc29uYWJsZSByZWQgcmVmbGVjdGluZyByZWdhbCByZWd1bGFyIHJlbGlhYmxlIHJlbGlldmVkIHJlbWFya2FibGUgcmVtb3JzZWZ1bCByZW1vdGUgcmVwZW50YW50IHJlcXVpcmVkIHJlc3BlY3RmdWwgcmVzcG9uc2libGUgcmVwdWxzaXZlIHJldm9sdmluZyByZXdhcmRpbmcgcmljaCByaWdpZCByaWdodCByaW5nZWQgcmlwZSByb2FzdGVkIHJvYnVzdCByb3N5IHJvdGF0aW5nIHJvdHRlbiByb3VnaCByb3VuZCByb3dkeSByb3lhbCBydWJiZXJ5IHJ1bmRvd24gcnVkZHkgcnVkZSBydW5ueSBydXJhbCBydXN0eSBzYWQgc2FmZSBzYWx0eSBzYW1lIHNhbmR5IHNhbmUgc2FyY2FzdGljIHNhcmRvbmljIHNhdGlzZmllZCBzY2FseSBzY2FyY2Ugc2NhcmVkIHNjYXJ5IHNjZW50ZWQgc2Nob2xhcmx5IHNjaWVudGlmaWMgc2Nvcm5mdWwgc2NyYXRjaHkgc2NyYXdueSBzZWNvbmQgc2Vjb25kYXJ5IHNlY29uZC1oYW5kIHNlY3JldCBzZWxmLWFzc3VyZWQgc2VsZi1yZWxpYW50IHNlbGZpc2ggc2VudGltZW50YWwgc2VwYXJhdGUgc2VyZW5lIHNlcmlvdXMgc2VycGVudGluZSBzZXZlcmFsIHNldmVyZSBzaGFiYnkgc2hhZG93eSBzaGFkeSBzaGFsbG93IHNoYW1lZnVsIHNoYW1lbGVzcyBzaGFycCBzaGltbWVyaW5nIHNoaW55IHNob2NrZWQgc2hvY2tpbmcgc2hvZGR5IHNob3J0IHNob3J0LXRlcm0gc2hvd3kgc2hyaWxsIHNoeSBzaWNrIHNpbGVudCBzaWxreSBzaWxseSBzaWx2ZXIgc2ltaWxhciBzaW1wbGUgc2ltcGxpc3RpYyBzaW5mdWwgc2luZ2xlIHNpenpsaW5nIHNrZWxldGFsIHNraW5ueSBzbGVlcHkgc2xpZ2h0IHNsaW0gc2xpbXkgc2xpcHBlcnkgc2xvdyBzbHVzaHkgc21hbGwgc21hcnQgc21vZ2d5IHNtb290aCBzbXVnIHNuYXBweSBzbmFybGluZyBzbmVha3kgc25pdmVsaW5nIHNub29weSBzb2NpYWJsZSBzb2Z0IHNvZ2d5IHNvbGlkIHNvbWJlciBzb21lIHNwaGVyaWNhbCBzb3BoaXN0aWNhdGVkIHNvcmUgc29ycm93ZnVsIHNvdWxmdWwgc291cHkgc291ciBTcGFuaXNoIHNwYXJrbGluZyBzcGFyc2Ugc3BlY2lmaWMgc3BlY3RhY3VsYXIgc3BlZWR5IHNwaWN5IHNwaWZmeSBzcGlyaXRlZCBzcGl0ZWZ1bCBzcGxlbmRpZCBzcG90bGVzcyBzcG90dGVkIHNwcnkgc3F1YXJlIHNxdWVha3kgc3F1aWdnbHkgc3RhYmxlIHN0YWlkIHN0YWluZWQgc3RhbGUgc3RhbmRhcmQgc3RhcmNoeSBzdGFyayBzdGFycnkgc3RlZXAgc3RpY2t5IHN0aWZmIHN0aW11bGF0aW5nIHN0aW5neSBzdG9ybXkgc3RyYWlnaHQgc3RyYW5nZSBzdGVlbCBzdHJpY3Qgc3RyaWRlbnQgc3RyaWtpbmcgc3RyaXBlZCBzdHJvbmcgc3R1ZGlvdXMgc3R1bm5pbmcgc3R1cGVuZG91cyBzdHVwaWQgc3R1cmR5IHN0eWxpc2ggc3ViZHVlZCBzdWJtaXNzaXZlIHN1YnN0YW50aWFsIHN1YnRsZSBzdWJ1cmJhbiBzdWRkZW4gc3VnYXJ5IHN1bm55IHN1cGVyIHN1cGVyYiBzdXBlcmZpY2lhbCBzdXBlcmlvciBzdXBwb3J0aXZlIHN1cmUtZm9vdGVkIHN1cnByaXNlZCBzdXNwaWNpb3VzIHN2ZWx0ZSBzd2VhdHkgc3dlZXQgc3dlbHRlcmluZyBzd2lmdCBzeW1wYXRoZXRpYyB0YWxsIHRhbGthdGl2ZSB0YW1lIHRhbiB0YW5naWJsZSB0YXJ0IHRhc3R5IHRhdHRlcmVkIHRhdXQgdGVkaW91cyB0ZWVtaW5nIHRlbXB0aW5nIHRlbmRlciB0ZW5zZSB0ZXBpZCB0ZXJyaWJsZSB0ZXJyaWZpYyB0ZXN0eSB0aGFua2Z1bCB0aGF0IHRoZXNlIHRoaWNrIHRoaW4gdGhpcmQgdGhpcnN0eSB0aGlzIHRob3JvdWdoIHRob3JueSB0aG9zZSB0aG91Z2h0ZnVsIHRocmVhZGJhcmUgdGhyaWZ0eSB0aHVuZGVyb3VzIHRpZHkgdGlnaHQgdGltZWx5IHRpbnRlZCB0aW55IHRpcmVkIHRvcm4gdG90YWwgdG91Z2ggdHJhdW1hdGljIHRyZWFzdXJlZCB0cmVtZW5kb3VzIHRyYWdpYyB0cmFpbmVkIHRyZW1lbmRvdXMgdHJpYW5ndWxhciB0cmlja3kgdHJpZmxpbmcgdHJpbSB0cml2aWFsIHRyb3VibGVkIHRydWUgdHJ1c3RpbmcgdHJ1c3R3b3J0aHkgdHJ1c3R5IHRydXRoZnVsIHR1YmJ5IHR1cmJ1bGVudCB0d2luIHVnbHkgdWx0aW1hdGUgdW5hY2NlcHRhYmxlIHVuYXdhcmUgdW5jb21mb3J0YWJsZSB1bmNvbW1vbiB1bmNvbnNjaW91cyB1bmRlcnN0YXRlZCB1bmVxdWFsZWQgdW5ldmVuIHVuZmluaXNoZWQgdW5maXQgdW5mb2xkZWQgdW5mb3J0dW5hdGUgdW5oYXBweSB1bmhlYWx0aHkgdW5pZm9ybSB1bmltcG9ydGFudCB1bmlxdWUgdW5pdGVkIHVua2VtcHQgdW5rbm93biB1bmxhd2Z1bCB1bmxpbmVkIHVubHVja3kgdW5uYXR1cmFsIHVucGxlYXNhbnQgdW5yZWFsaXN0aWMgdW5yaXBlIHVucnVseSB1bnNlbGZpc2ggdW5zaWdodGx5IHVuc3RlYWR5IHVuc3VuZyB1bnRpZHkgdW50aW1lbHkgdW50cmllZCB1bnRydWUgdW51c2VkIHVudXN1YWwgdW53ZWxjb21lIHVud2llbGR5IHVud2lsbGluZyB1bndpdHRpbmcgdW53cml0dGVuIHVwYmVhdCB1cHJpZ2h0IHVwc2V0IHVyYmFuIHVzYWJsZSB1c2VkIHVzZWZ1bCB1c2VsZXNzIHV0aWxpemVkIHV0dGVyIHZhY2FudCB2YWd1ZSB2YWluIHZhbGlkIHZhbHVhYmxlIHZhcGlkIHZhcmlhYmxlIHZhc3QgdmVsdmV0eSB2ZW5lcmF0ZWQgdmVuZ2VmdWwgdmVyaWZpYWJsZSB2aWJyYW50IHZpY2lvdXMgdmljdG9yaW91cyB2aWdpbGFudCB2aWdvcm91cyB2aWxsYWlub3VzIHZpb2xldCB2aW9sZW50IHZpcnR1YWwgdmlydHVvdXMgdmlzaWJsZSB2aXRhbCB2aXZhY2lvdXMgdml2aWQgdm9sdW1pbm91cyB3YW4gd2FybGlrZSB3YXJtIHdhcm1oZWFydGVkIHdhcnBlZCB3YXJ5IHdhc3RlZnVsIHdhdGNoZnVsIHdhdGVybG9nZ2VkIHdhdGVyeSB3YXZ5IHdlYWx0aHkgd2VhayB3ZWFyeSB3ZWJiZWQgd2VlIHdlZWtseSB3ZWVweSB3ZWlnaHR5IHdlaXJkIHdlbGNvbWUgd2VsbC1kb2N1bWVudGVkIHdlbGwtZ3Jvb21lZCB3ZWxsLWluZm9ybWVkIHdlbGwtbGl0IHdlbGwtbWFkZSB3ZWxsLW9mZiB3ZWxsLXRvLWRvIHdlbGwtd29ybiB3ZXQgd2hpY2ggd2hpbXNpY2FsIHdoaXJsd2luZCB3aGlzcGVyZWQgd2hpdGUgd2hvbGUgd2hvcHBpbmcgd2lja2VkIHdpZGUgd2lkZS1leWVkIHdpZ2dseSB3aWxkIHdpbGxpbmcgd2lsdGVkIHdpbmRpbmcgd2luZHkgd2luZ2VkIHdpcnkgd2lzZSB3aXR0eSB3b2JibHkgd29lZnVsIHdvbmRlcmZ1bCB3b29kZW4gd29venkgd29yZHkgd29ybGRseSB3b3JuIHdvcnJpZWQgd29ycmlzb21lIHdvcnNlIHdvcnN0IHdvcnRobGVzcyB3b3J0aHdoaWxlIHdvcnRoeSB3cmF0aGZ1bCB3cmV0Y2hlZCB3cml0aGluZyB3cm9uZyB3cnkgeWF3bmluZyB5ZWFybHkgeWVsbG93IHllbGxvd2lzaCB5b3VuZyB5b3V0aGZ1bCB5dW1teSB6YW55IHplYWxvdXMgemVzdHkgemlnemFn")).Split($null)
        $verbs = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("YWNjZXB0IGFjaGUgYWNrbm93bGVkZ2UgYWN0IGFkZCBhZG1pcmUgYWRtaXQgYWRtb25pc2ggYWR2aXNlIGFkb3B0IGFmZmlybSBhZmZvcmQgYWdyZWUgYWlsIGFsZXJ0IGFsbGVnZSBhbGxvdyBhbGx1ZGUgYW11c2UgYW5hbHl6ZSBhbm5vdW5jZSBhbm5veSBhbnN3ZXIgYXBvbG9naXplIGFwcGVhbCBhcHBlYXIgYXBwbGF1ZCBhcHByZWNpYXRlIGFwcHJvdmUgYXJndWUgYXJyYW5nZSBhcnJlc3QgYXJyaXZlIGFydGljdWxhdGUgYXNrIGFzc2VydCBhc3N1cmUgYXR0YWNoIGF0dGFjayBhdHRlbXB0IGF0dGVuZCBhdHRyYWN0IGF1Y3Rpb24gYXZvaWQgYXZvdyBhd2FrZSBiYWJibGUgYmFjayBiYWtlIGJhbGFuY2UgYmFsayBiYW4gYmFuZyBiYW5kYWdlIGJhciBiYXJlIGJhcmdhaW4gYmFyayBiYXJyYWdlIGJhcnRlciBiYXN0ZSBiYXQgYmF0aGUgYmF0dGxlIGJhd2wgYmUgYmVhbSBiZWFyIGJlYXQgYmVjb21lIGJlZnJpZW5kIGJlZyBiZWdpbiBiZWhhdmUgYmVsaWV2ZSBiZWxsb3cgYmVsb25nIGJlbmQgYmVyYXRlIGJlc2llZ2UgYmVzdG93IGJldCBiaWQgYml0ZSBibGVhY2ggYmxlZWQgYmxlc3MgYmxpbmQgYmxpbmsgYmxvdCBibG93IGJsdXJ0IGJsdXNoIGJvYXN0IGJvYiBib2lsIGJvbHQgYm9tYiBib29rIGJvcmUgYm9ycm93IGJvdW5jZSBib3cgYm94IGJyYWcgYnJha2UgYnJhbmNoIGJyYW5kIGJyZWFrIGJyZWF0aGUgYnJlZWQgYnJpbmcgYnJvYWRjYXN0IGJyb2lsIGJydWlzZSBicnVzaCBidWJibGUgYnVpbGQgYnVtcCBidXJuIGJ1cm5pc2ggYnVyeSBidXkgYnV6eiBjYWpvbGUgY2FsY3VsYXRlIGNhbGwgY2FtcCBjYXJlIGNhcnJ5IGNhcnZlIGNhdXNlIGNhdXRpb24gY2F0Y2ggY2hhbGxlbmdlIGNoYW5nZSBjaGFudCBjaGFyZ2UgY2hhc2UgY2hlYXQgY2hlY2sgY2hlZXIgY2hldyBjaGlkZSBjaGlwIGNob2tlIGNob21wIGNob29zZSBjaG9wIGNsYWltIGNsYXAgY2xlYW4gY2xlYXIgY2xpbWIgY2xpcCBjbG9zZSBjb2FjaCBjb2lsIGNvbGxlY3QgY29sb3IgY29tYiBjb21lIGNvbWZvcnQgY29tbWFuZCBjb21tZW50IGNvbW11bmljYXRlIGNvbXBhcmUgY29tcGV0ZSBjb21wbGFpbiBjb21wbGV0ZSBjb25jZWRlIGNvbmNlbnRyYXRlIGNvbmNlcm4gY29uY2x1ZGUgY29uY3VyIGNvbmZlc3MgY29uZmlkZSBjb25maXJtIGNvbm5lY3QgY29uc2VudCBjb25zaWRlciBjb25zaXN0IGNvbnRhaW4gY29udGVuZCBjb250aW51ZSBjb29rIGNvcHkgY29ycmVjdCBjb3N0IGNvdWdoIGNvdW50IGNvdW50ZXIgY292ZXIgY292ZXQgY3JhY2sgY3Jhc2ggY3JhdmUgY3Jhd2wgY3JvY2hldCBjcm9zcyBjcml0aWNpemUgY3JvYWsgY3Jvc3MtZXhhbWluZSBjcm93ZCBjcnVzaCBjcnkgY3VyZSBjdXJsIGN1cnNlIGN1cnZlIGN1dCBjeWNsZSBkYW0gZGFtYWdlIGRhbmNlIGRhcmUgZGVhbCBkZWJhdGUgZGVjYXkgZGVjZWl2ZSBkZWNpZGUgZGVjaXBoZXIgZGVjbGFyZSBkZWNvcmF0ZSBkZWxheSBkZWxpZ2h0IGRlbGl2ZXIgZGVtYW5kIGRlbnkgZGVwZW5kIGRlc2NyaWJlIGRlc2VydCBkZXNlcnZlIGRlc2lyZSBkZXRlciBkZXZlbG9wIGRpYWwgZGljdGF0ZSBkaWUgZGlnIGRpZ3Jlc3MgZGlyZWN0IGRpc2Nsb3NlIGRpc2xpa2UgZGl2ZSBkaXZpZGUgZGl2b3JjZSBkaXZ1bGdlIGRvIGRvY2sgZG9sZSBkb3RlIGRvdWJsZSBkb3VidCBkcmFnIGRyYWluIGRyYXcgZHJlYW0gZHJlc3MgZHJpcCBkcmlsbCBkcmluayBkcml2ZSBkcm9uZSBkcm9wIGRyb3duIGRyeSBkdXBlIGR1bXAgZHVzdCBkeWUgZWFybiBlYXQgZWNobyBlZGl0IGVkdWNhdGUgZWxvcGUgZW1iYXJyYXNzIGVtaWdyYXRlIGVtaXQgZW1waGFzaXplIGVtcGxveSBlbXB0eSBlbmNoYW50IGVuY29kZSBlbmNvdXJhZ2UgZW5kIGVuam9pbiBlbmpveSBlbnRlciBlbnRlcnRhaW4gZW51bmNpYXRlIGVudnkgZXF1aXZvY2F0ZSBlc2NhcGUgZXZhY3VhdGUgZXZhcG9yYXRlIGV4YWdnZXJhdGUgZXhhbWluZSBleGNpdGUgZXhjbGFpbSBleGN1c2UgZXhlcmNpc2UgZXhpc3QgZXhwYW5kIGV4cGVjdCBleHBlbCBleGhvcnQgZXhwbGFpbiBleHBsb2RlIGV4cGxvcmUgZXh0ZW5kIGV4dG9sbCBmYWNlIGZhZGUgZmFpbCBmYWxsIGZhbHRlciBmYXN0ZW4gZmF2b3IgZmF4IGZlYXIgZmVlZCBmZWVsIGZlbmNlIGZldGNoIGZpZ2h0IGZpbGUgZmlsbCBmaWxtIGZpbmQgZmlyZSBmaXNoIGZpdCBmaXggZmxhcCBmbGFzaCBmbGVlIGZsb2F0IGZsb29kIGZsb3NzIGZsb3cgZmxvd2VyIGZseSBmb2xkIGZvbGxvdyBmb29sIGZvcmNlIGZvcmV0ZWxsIGZvcmdldCBmb3JnaXZlIGZvcm0gZm91bmQgZnJhbWUgZnJlZXplIGZyZXQgZnJpZ2h0ZW4gZnJ5IGZ1bWUgZ2FyZGVuIGdhc3AgZ2F0aGVyIGdhemUgZ2VsIGdldCBnaWxkIGdpdmUgZ2xpZGUgZ2x1ZSBnbmF3IGdvIGdyYWIgZ3JhdGUgZ3JlYXNlIGdyZWV0IGdyaWxsIGdyaW4gZ3JpcCBncm9hbiBncm93IGdyb3dsIGdydW1ibGUgZ3J1bnQgZ3VhcmFudGVlIGd1YXJkIGd1ZXNzIGd1aWRlIGd1cmdsZSBndXNoIGhhaWwgaGFtbWVyIGhhbmQgaGFuZGxlIGhhbmcgaGFwcGVuIGhhcmFzcyBoYXJtIGhhcm5lc3MgaGF0ZSBoYXVudCBoYXZlIGhlYWQgaGVhbCBoZWFwIGhlYXIgaGVhdCBoZWxwIGhpZGUgaGlnaGxpZ2h0IGhpamFjayBoaW5kZXIgaGludCBoaXNzIGhpdCBob2xkIGhvb2sgaG9vdCBob3AgaG9wZSBob3ZlciBob3dsIGh1ZyBodW0gaHVudCBodXJyeSBodXJ0IGljZSBpZGVudGlmeSBpZ25vcmUgaW1hZ2luZSBpbW1pZ3JhdGUgaW1wbHkgaW1wbG9yZSBpbXByZXNzIGltcHJvdmUgaW5jbHVkZSBpbmNyZWFzZSBpbmZlY3QgaW5mbGF0ZSBpbmZsdWVuY2UgaW5mb3JtIGluZnVzZSBpbmplY3QgaW5qdXJlIGlucXVpcmUgaW5zaXN0IGluc3BlY3QgaW5zcGlyZSBpbnN0cnVjdCBpbnRlbmQgaW50ZXJlc3QgaW50ZXJmZXJlIGludGVyamVjdCBpbnRlcnJ1cHQgaW50cm9kdWNlIGludmVudCBpbnZlc3QgaW52aXRlIGlycml0YXRlIGlyb24gaXRjaCBqYWIgamFiYmVyIGphaWwgamFtIGplZXIgamVzdCBqb2cgam9pbiBqb2tlIGpvbHQganVkZ2UganVnZ2xlIGp1bXAga2VlcCBraWNrIGtpbGwga2lzcyBrbmVlbCBrbml0IGtub2NrIGtub3Qga25vdyBsYWJlbCBsYW1lbnQgbGFuZCBsYXN0IGxhdWdoIGxheSBsZWFkIGxlYW4gbGVhcm4gbGVhdmUgbGVjdHVyZSBsZW5kIGxldCBsZXZlbCBsaWNlbnNlIGxpY2sgbGllIGxpZnQgbGlnaHQgbGlnaHRlbiBsaWtlIGxpc3QgbGlzdGVuIGxpdmUgbG9hZCBsb2FuIGxvY2sgbG9uZyBsb29rIGxvb3NlbiBsb3NlIGxvdmUgbG93ZXIgbWFpbCBtYWludGFpbiBtYWtlIG1hbiBtYW5hZ2UgbWFyIG1hcmNoIG1hcmsgbWFycnkgbWFydmVsIG1hdGUgbWF0dGVyIG1lYW4gbWVhc3VyZSBtZWV0IG1lbHQgbWVtb3JpemUgbWVuZCBtZW50aW9uIG1lcmdlIG1pbGsgbWluZSBtaXNzIG1peCBtb2FuIG1vb3IgbW91cm4gbW9sdCBtb3ZlIG1vdyBtdWcgbXVsdGlwbHkgbXVtYmxlIG11cmRlciBtdXR0ZXIgbmFnIG5haWwgbmFtZSBuYXAgbmVlZCBuZXN0IG5vZCBub3RlIG5vdGljZSBudW1iZXIgb2JleSBvYmplY3Qgb2JzZXJ2ZSBvYnRhaW4gb2NjdXIgb2ZmZW5kIG9mZmVyIG9nbGUgb2lsIG9taXQgb3BlbiBvcGVyYXRlIG9yZGVyIG92ZXJmbG93IG92ZXJydW4gb3dlIG93biBwYWNrIHBhZCBwYWRkbGUgcGFpbnQgcGFudCBwYXJrIHBhcnQgcGFzcyBwYXN0ZSBwYXQgcGF1c2UgcGF5IHBlY2sgcGVkYWwgcGVlbCBwZWVwIHBlZXIgcGVnIHBlbHQgcGVyZm9ybSBwZXJtaXQgcGVzdGVyIHBldCBwaG9uZSBwaWNrIHBpbmNoIHBpbmUgcGxhY2UgcGxhbiBwbGFudCBwbGF5IHBsZWFkIHBsZWFzZSBwbGVkZ2UgcGxvdyBwbHVnIHBvaW50IHBva2UgcG9saXNoIHBvbmRlciBwb3AgcG9zc2VzcyBwb3N0IHBvc3R1bGF0ZSBwb3VyIHByYWN0aWNlIHByYXkgcHJlYWNoIHByZWNlZGUgcHJlZGljdCBwcmVmZXIgcHJlcGFyZSBwcmVzZW50IHByZXNlcnZlIHByZXNzIHByZXRlbmQgcHJldmVudCBwcmljayBwcmludCBwcm9jZWVkIHByb2NsYWltIHByb2R1Y2UgcHJvZmVzcyBwcm9ncmFtIHByb21pc2UgcHJvcG9zZSBwcm90ZWN0IHByb3Rlc3QgcHJvdmlkZSBwcnkgcHVsbCBwdW1wIHB1bmNoIHB1bmN0dXJlIHB1bmlzaCBwdXNoIHB1dCBxdWVzdGlvbiBxdWlsdCBxdWl0IHF1aXogcXVvdGUgcmFjZSByYWRpYXRlIHJhaW4gcmFpc2UgcmFudCByYWluIHJhdGUgcmF2ZSByZWFjaCByZWFsaXplIHJlYWQgcmVidWZmIHJlY2FsbCByZWNlaXZlIHJlY2l0ZSByZWNvZ25pemUgcmVjb21tZW5kIHJlY29yZCByZWR1Y2UgcmVmbGVjdCByZWZ1c2UgcmVncmV0IHJlaWduIHJlaXRlcmF0ZSByZWplY3QgcmVqb2ljZSByZWxhdGUgcmVsYXggcmVsZWFzZSByZWx5IHJlbWFpbiByZW1lbWJlciByZW1pbmQgcmVtb3ZlIHJlcGFpciByZXBlYXQgcmVwbGFjZSByZXBseSByZXBvcnQgcmVwcmltYW5kIHJlcHJvZHVjZSByZXF1ZXN0IHJlc2N1ZSByZXRpcmUgcmV0b3J0IHJldHVybiByZXZlYWwgcmV2ZXJzZSByaHltZSByaWRlIHJpbmcgcmluc2UgcmlzZSByaXNrIHJvYXIgcm9iIHJvY2sgcm9sbCByb3Qgcm93IHJ1YiBydWluIHJ1bGUgcnVuIHJ1c2ggc2FjayBzYWlsIHNhdGlzZnkgc2F2ZSBzYXZvciBzYXcgc2F5IHNjYXJlIHNjYXR0ZXIgc2NvZmYgc2NvbGQgc2Nvb3Qgc2NvcmNoIHNjcmFwZSBzY3JhdGNoIHNjcmVhbSBzY3JlZWNoIHNjcmV3IHNjcmliYmxlIHNlYWwgc2VhcmNoIHNlZSBzZWxsIHNlbmQgc2Vuc2Ugc2VwYXJhdGUgc2VydmUgc2V0IHNldHRsZSBzZXZlciBzZXcgc2hhZGUgc2hhbXBvbyBzaGFyZSBzaGF2ZSBzaGVsdGVyIHNoaWZ0IHNoaXZlciBzaG9jayBzaG9vdCBzaG9wIHNob3V0IHNob3cgc2hyaWVrIHNocnVnIHNodXQgc2lnaCBzaWduIHNpZ25hbCBzaW4gc2luZyBzaW5nZSBzaXAgc2l0IHNrYXRlIHNrYXRlYm9hcmQgc2tldGNoIHNraSBza2lwIHNsYXAgc2xlZXAgc2xpY2Ugc2xpZGUgc2xpcCBzbG93IHNtYXNoIHNtZWxsIHNtaWxlIHNtb2tlIHNuYXAgc25hcmwgc25hdGNoIHNuZWFrIHNuZWVyIHNuZWV6ZSBzbmlja2VyIHNuaWZmIHNub3JlIHNub3J0IHNub29wIHNub296ZSBzbm93IHNvYWsgc29iIHNvb3RoZSBzb3VuZCBzb3cgc3BhbiBzcGFyZSBzcGFyayBzcGFya2xlIHNwZWFrIHNwZWN1bGF0ZSBzcGVsbCBzcGVuZCBzcGlsbCBzcGluIHNwb2lsIHNwb3Qgc3ByYXkgc3Byb3V0IHNwdXR0ZXIgc3F1YXNoIHNxdWVlemUgc3RhYiBzdGFpbiBzdGFtbWVyIHN0YW1wIHN0YW5kIHN0YXIgc3RhcmUgc3RhcnQgc3Rhc2ggc3RhdGUgc3RheSBzdGVlciBzdGVwIHN0aXB1bGF0ZSBzdGlyIHN0aXRjaCBzdG9wIHN0b3JlIHN0cmFwIHN0b3JtIHN0b3cgc3RyZW5ndGhlbiBzdHJlc3Mgc3RyZXRjaCBzdHJpcCBzdHJva2Ugc3R1ZmYgc3R1dHRlciBzdHJheSBzdHJ1bSBzdHJ1dCBzdHVuIHN0dW50IHN1Ym1lcmdlIHN1Y2NlZWQgc3VmZmVyIHN1Z2dlc3Qgc3VpdCBzdXBwbHkgc3VwcG9ydCBzdXBwb3NlIHN1cm1pc2Ugc3VycHJpc2Ugc3Vycm91bmQgc3VzcGVjdCBzdXNwZW5kIHN3YXkgc3dlYXIgc3dpbSBzd2luZyBzd2l0Y2ggc3dvb3Agc3ltcGF0aGl6ZSB0YWxrIHRha2UgdGFtZSB0YXAgdGFzdGUgdGF1bnQgdGVhY2ggdGVhciB0ZWFzZSB0ZWxlcGhvbmUgdGVsbCB0ZW1wdCB0ZXJyaWZ5IHRlc3QgdGVzdGlmeSB0aGFuayB0aGF3IHRoZW9yaXplIHRoaW5rIHRocmVhdGVuIHRocm93IHRodW5kZXIgdGljayB0aWNrbGUgdGllIHRpbWUgdGlwIHRpcmUgdG9hc3QgdG9zcyB0b3VjaCB0b3VyIHRvdyB0cmFjZSB0cmFjayB0cmFkZSB0cmFpbiB0cmFuc2xhdGUgdHJhbnNwb3J0IHRyYXAgdHJhdmVsIHRyZWF0IHRyZW1ibGUgdHJpY2sgdHJpY2tsZSB0cmltIHRyaXAgdHJvdCB0cm91YmxlIHRydXN0IHRyb3VuY2UgdHJ5IHR1ZyB0dW1ibGUgdHVybiB0d2lzdCB0eXBlIHVuZGVyc3RhbmQgdW5kcmVzcyB1bmZhc3RlbiB1bml0ZSB1bmxvY2sgdW5wYWNrIHVwaG9sZCB1cHNldCB1cHN0YWdlIHVyZ2UgdW50aWUgdXNlIHVzdXJwIHV0dGVyIHZhY3V1bSB2YWx1ZSB2YW5pc2ggdmFucXVpc2ggdmVudHVyZSB2aXNpdCB2b2ljZSB2b2x1bnRlZXIgdm90ZSB2b3VjaCB3YWlsIHdhaXQgd2FrZSB3YWxrIHdhbGxvdyB3YW5kZXIgd2FudCB3YXJtIHdhcm4gd2FzaCB3YXN0ZSB3YXRjaCB3YXRlciB3YXZlIHdhdmVyIHdlYXIgd2VhdmUgd2VkIHdlaWdoIHdlbGNvbWUgd2hpbXBlciB3aGluZSB3aGlwIHdoaXJsIHdoaXNwZXIgd2hpc3RsZSB3aW4gd2luayB3aXBlIHdpc2ggd29iYmxlIHdvbmRlciB3b3JrIHdvcnJ5IHdyYXAgd3JlY2sgd3Jlc3RsZSB3cmlnZ2xlIHdyaXRlIHdyaXRoZSB4LXJheSB5YXduIHllbGwgeWVscCB5aWVsZCB5b2RlbCB6aXAgem9vbQ==")).Split($null)
        $nouns = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("cGVvcGxlIGhpc3Rvcnkgd2F5IGFydCB3b3JsZCBpbmZvcm1hdGlvbiBtYXAgdHdvIGZhbWlseSBnb3Zlcm5tZW50IGhlYWx0aCBzeXN0ZW0gY29tcHV0ZXIgbWVhdCB5ZWFyIHRoYW5rcyBtdXNpYyBwZXJzb24gcmVhZGluZyBtZXRob2QgZGF0YSBmb29kIHVuZGVyc3RhbmRpbmcgdGhlb3J5IGxhdyBiaXJkIGxpdGVyYXR1cmUgcHJvYmxlbSBzb2Z0d2FyZSBjb250cm9sIGtub3dsZWRnZSBwb3dlciBhYmlsaXR5IGVjb25vbWljcyBsb3ZlIGludGVybmV0IHRlbGV2aXNpb24gc2NpZW5jZSBsaWJyYXJ5IG5hdHVyZSBmYWN0IHByb2R1Y3QgaWRlYSB0ZW1wZXJhdHVyZSBpbnZlc3RtZW50IGFyZWEgc29jaWV0eSBhY3Rpdml0eSBzdG9yeSBpbmR1c3RyeSBtZWRpYSB0aGluZyBvdmVuIGNvbW11bml0eSBkZWZpbml0aW9uIHNhZmV0eSBxdWFsaXR5IGRldmVsb3BtZW50IGxhbmd1YWdlIG1hbmFnZW1lbnQgcGxheWVyIHZhcmlldHkgdmlkZW8gd2VlayBzZWN1cml0eSBjb3VudHJ5IGV4YW0gbW92aWUgb3JnYW5pemF0aW9uIGVxdWlwbWVudCBwaHlzaWNzIGFuYWx5c2lzIHBvbGljeSBzZXJpZXMgdGhvdWdodCBiYXNpcyBib3lmcmllbmQgZGlyZWN0aW9uIHN0cmF0ZWd5IHRlY2hub2xvZ3kgYXJteSBjYW1lcmEgZnJlZWRvbSBwYXBlciBlbnZpcm9ubWVudCBjaGlsZCBpbnN0YW5jZSBtb250aCB0cnV0aCBtYXJrZXRpbmcgdW5pdmVyc2l0eSB3cml0aW5nIGFydGljbGUgZGVwYXJ0bWVudCBkaWZmZXJlbmNlIGdvYWwgbmV3cyBhdWRpZW5jZSBmaXNoaW5nIGdyb3d0aCBpbmNvbWUgbWFycmlhZ2UgdXNlciBjb21iaW5hdGlvbiBmYWlsdXJlIG1lYW5pbmcgbWVkaWNpbmUgcGhpbG9zb3BoeSB0ZWFjaGVyIGNvbW11bmljYXRpb24gbmlnaHQgY2hlbWlzdHJ5IGRpc2Vhc2UgZGlzayBlbmVyZ3kgbmF0aW9uIHJvYWQgcm9sZSBzb3VwIGFkdmVydGlzaW5nIGxvY2F0aW9uIHN1Y2Nlc3MgYWRkaXRpb24gYXBhcnRtZW50IGVkdWNhdGlvbiBtYXRoIG1vbWVudCBwYWludGluZyBwb2xpdGljcyBhdHRlbnRpb24gZGVjaXNpb24gZXZlbnQgcHJvcGVydHkgc2hvcHBpbmcgc3R1ZGVudCB3b29kIGNvbXBldGl0aW9uIGRpc3RyaWJ1dGlvbiBlbnRlcnRhaW5tZW50IG9mZmljZSBwb3B1bGF0aW9uIHByZXNpZGVudCB1bml0IGNhdGVnb3J5IGNpZ2FyZXR0ZSBjb250ZXh0IGludHJvZHVjdGlvbiBvcHBvcnR1bml0eSBwZXJmb3JtYW5jZSBkcml2ZXIgZmxpZ2h0IGxlbmd0aCBtYWdhemluZSBuZXdzcGFwZXIgcmVsYXRpb25zaGlwIHRlYWNoaW5nIGNlbGwgZGVhbGVyIGZpbmRpbmcgbGFrZSBtZW1iZXIgbWVzc2FnZSBwaG9uZSBzY2VuZSBhcHBlYXJhbmNlIGFzc29jaWF0aW9uIGNvbmNlcHQgY3VzdG9tZXIgZGVhdGggZGlzY3Vzc2lvbiBob3VzaW5nIGluZmxhdGlvbiBpbnN1cmFuY2UgbW9vZCB3b21hbiBhZHZpY2UgYmxvb2QgZWZmb3J0IGV4cHJlc3Npb24gaW1wb3J0YW5jZSBvcGluaW9uIHBheW1lbnQgcmVhbGl0eSByZXNwb25zaWJpbGl0eSBzaXR1YXRpb24gc2tpbGwgc3RhdGVtZW50IHdlYWx0aCBhcHBsaWNhdGlvbiBjaXR5IGNvdW50eSBkZXB0aCBlc3RhdGUgZm91bmRhdGlvbiBncmFuZG1vdGhlciBoZWFydCBwZXJzcGVjdGl2ZSBwaG90byByZWNpcGUgc3R1ZGlvIHRvcGljIGNvbGxlY3Rpb24gZGVwcmVzc2lvbiBpbWFnaW5hdGlvbiBwYXNzaW9uIHBlcmNlbnRhZ2UgcmVzb3VyY2Ugc2V0dGluZyBhZCBhZ2VuY3kgY29sbGVnZSBjb25uZWN0aW9uIGNyaXRpY2lzbSBkZWJ0IGRlc2NyaXB0aW9uIG1lbW9yeSBwYXRpZW5jZSBzZWNyZXRhcnkgc29sdXRpb24gYWRtaW5pc3RyYXRpb24gYXNwZWN0IGF0dGl0dWRlIGRpcmVjdG9yIHBlcnNvbmFsaXR5IHBzeWNob2xvZ3kgcmVjb21tZW5kYXRpb24gcmVzcG9uc2Ugc2VsZWN0aW9uIHN0b3JhZ2UgdmVyc2lvbiBhbGNvaG9sIGFyZ3VtZW50IGNvbXBsYWludCBjb250cmFjdCBlbXBoYXNpcyBoaWdod2F5IGxvc3MgbWVtYmVyc2hpcCBwb3NzZXNzaW9uIHByZXBhcmF0aW9uIHN0ZWFrIHVuaW9uIGFncmVlbWVudCBjYW5jZXIgY3VycmVuY3kgZW1wbG95bWVudCBlbmdpbmVlcmluZyBlbnRyeSBpbnRlcmFjdGlvbiBtaXh0dXJlIHByZWZlcmVuY2UgcmVnaW9uIHJlcHVibGljIHRyYWRpdGlvbiB2aXJ1cyBhY3RvciBjbGFzc3Jvb20gZGVsaXZlcnkgZGV2aWNlIGRpZmZpY3VsdHkgZHJhbWEgZWxlY3Rpb24gZW5naW5lIGZvb3RiYWxsIGd1aWRhbmNlIGhvdGVsIG93bmVyIHByaW9yaXR5IHByb3RlY3Rpb24gc3VnZ2VzdGlvbiB0ZW5zaW9uIHZhcmlhdGlvbiBhbnhpZXR5IGF0bW9zcGhlcmUgYXdhcmVuZXNzIGJhdGggYnJlYWQgY2FuZGlkYXRlIGNsaW1hdGUgY29tcGFyaXNvbiBjb25mdXNpb24gY29uc3RydWN0aW9uIGVsZXZhdG9yIGVtb3Rpb24gZW1wbG95ZWUgZW1wbG95ZXIgZ3Vlc3QgaGVpZ2h0IGxlYWRlcnNoaXAgbWFsbCBtYW5hZ2VyIG9wZXJhdGlvbiByZWNvcmRpbmcgc2FtcGxlIHRyYW5zcG9ydGF0aW9uIGNoYXJpdHkgY291c2luIGRpc2FzdGVyIGVkaXRvciBlZmZpY2llbmN5IGV4Y2l0ZW1lbnQgZXh0ZW50IGZlZWRiYWNrIGd1aXRhciBob21ld29yayBsZWFkZXIgbW9tIG91dGNvbWUgcGVybWlzc2lvbiBwcmVzZW50YXRpb24gcHJvbW90aW9uIHJlZmxlY3Rpb24gcmVmcmlnZXJhdG9yIHJlc29sdXRpb24gcmV2ZW51ZSBzZXNzaW9uIHNpbmdlciB0ZW5uaXMgYmFza2V0IGJvbnVzIGNhYmluZXQgY2hpbGRob29kIGNodXJjaCBjbG90aGVzIGNvZmZlZSBkaW5uZXIgZHJhd2luZyBoYWlyIGhlYXJpbmcgaW5pdGlhdGl2ZSBqdWRnbWVudCBsYWIgbWVhc3VyZW1lbnQgbW9kZSBtdWQgb3JhbmdlIHBvZXRyeSBwb2xpY2UgcG9zc2liaWxpdHkgcHJvY2VkdXJlIHF1ZWVuIHJhdGlvIHJlbGF0aW9uIHJlc3RhdXJhbnQgc2F0aXNmYWN0aW9uIHNlY3RvciBzaWduYXR1cmUgc2lnbmlmaWNhbmNlIHNvbmcgdG9vdGggdG93biB2ZWhpY2xlIHZvbHVtZSB3aWZlIGFjY2lkZW50IGFpcnBvcnQgYXBwb2ludG1lbnQgYXJyaXZhbCBhc3N1bXB0aW9uIGJhc2ViYWxsIGNoYXB0ZXIgY29tbWl0dGVlIGNvbnZlcnNhdGlvbiBkYXRhYmFzZSBlbnRodXNpYXNtIGVycm9yIGV4cGxhbmF0aW9uIGZhcm1lciBnYXRlIGdpcmwgaGFsbCBoaXN0b3JpYW4gaG9zcGl0YWwgaW5qdXJ5IGluc3RydWN0aW9uIG1haW50ZW5hbmNlIG1hbnVmYWN0dXJlciBtZWFsIHBlcmNlcHRpb24gcGllIHBvZW0gcHJlc2VuY2UgcHJvcG9zYWwgcmVjZXB0aW9uIHJlcGxhY2VtZW50IHJldm9sdXRpb24gcml2ZXIgc29uIHNwZWVjaCB0ZWEgdmlsbGFnZSB3YXJuaW5nIHdpbm5lciB3b3JrZXIgd3JpdGVyIGFzc2lzdGFuY2UgYnJlYXRoIGJ1eWVyIGNoZXN0IGNob2NvbGF0ZSBjb25jbHVzaW9uIGNvbnRyaWJ1dGlvbiBjb29raWUgY291cmFnZSBkYWQgZGVzayBkcmF3ZXIgZXN0YWJsaXNobWVudCBleGFtaW5hdGlvbiBnYXJiYWdlIGdyb2NlcnkgaG9uZXkgaW1wcmVzc2lvbiBpbXByb3ZlbWVudCBpbmRlcGVuZGVuY2UgaW5zZWN0IGluc3BlY3Rpb24gaW5zcGVjdG9yIGtpbmcgbGFkZGVyIG1lbnUgcGVuYWx0eSBwaWFubyBwb3RhdG8gcHJvZmVzc2lvbiBwcm9mZXNzb3IgcXVhbnRpdHkgcmVhY3Rpb24gcmVxdWlyZW1lbnQgc2FsYWQgc2lzdGVyIHN1cGVybWFya2V0IHRvbmd1ZSB3ZWFrbmVzcyB3ZWRkaW5nIGFmZmFpciBhbWJpdGlvbiBhbmFseXN0IGFwcGxlIGFzc2lnbm1lbnQgYXNzaXN0YW50IGJhdGhyb29tIGJlZHJvb20gYmVlciBiaXJ0aGRheSBjZWxlYnJhdGlvbiBjaGFtcGlvbnNoaXAgY2hlZWsgY2xpZW50IGNvbnNlcXVlbmNlIGRlcGFydHVyZSBkaWFtb25kIGRpcnQgZWFyIGZvcnR1bmUgZnJpZW5kc2hpcCBmdW5lcmFsIGdlbmUgZ2lybGZyaWVuZCBoYXQgaW5kaWNhdGlvbiBpbnRlbnRpb24gbGFkeSBtaWRuaWdodCBuZWdvdGlhdGlvbiBvYmxpZ2F0aW9uIHBhc3NlbmdlciBwaXp6YSBwbGF0Zm9ybSBwb2V0IHBvbGx1dGlvbiByZWNvZ25pdGlvbiByZXB1dGF0aW9uIHNoaXJ0IHNpciBzcGVha2VyIHN0cmFuZ2VyIHN1cmdlcnkgc3ltcGF0aHkgdGFsZSB0aHJvYXQgdHJhaW5lciB1bmNsZSB5b3V0aCB0aW1lIHdvcmsgZmlsbSB3YXRlciBtb25leSBleGFtcGxlIHdoaWxlIGJ1c2luZXNzIHN0dWR5IGdhbWUgbGlmZSBmb3JtIGFpciBkYXkgcGxhY2UgbnVtYmVyIHBhcnQgZmllbGQgZmlzaCBiYWNrIHByb2Nlc3MgaGVhdCBoYW5kIGV4cGVyaWVuY2Ugam9iIGJvb2sgZW5kIHBvaW50IHR5cGUgaG9tZSBlY29ub215IHZhbHVlIGJvZHkgbWFya2V0IGd1aWRlIGludGVyZXN0IHN0YXRlIHJhZGlvIGNvdXJzZSBjb21wYW55IHByaWNlIHNpemUgY2FyZCBsaXN0IG1pbmQgdHJhZGUgbGluZSBjYXJlIGdyb3VwIHJpc2sgd29yZCBmYXQgZm9yY2Uga2V5IGxpZ2h0IHRyYWluaW5nIG5hbWUgc2Nob29sIHRvcCBhbW91bnQgbGV2ZWwgb3JkZXIgcHJhY3RpY2UgcmVzZWFyY2ggc2Vuc2Ugc2VydmljZSBwaWVjZSB3ZWIgYm9zcyBzcG9ydCBmdW4gaG91c2UgcGFnZSB0ZXJtIHRlc3QgYW5zd2VyIHNvdW5kIGZvY3VzIG1hdHRlciBraW5kIHNvaWwgYm9hcmQgb2lsIHBpY3R1cmUgYWNjZXNzIGdhcmRlbiByYW5nZSByYXRlIHJlYXNvbiBmdXR1cmUgc2l0ZSBkZW1hbmQgZXhlcmNpc2UgaW1hZ2UgY2FzZSBjYXVzZSBjb2FzdCBhY3Rpb24gYWdlIGJhZCBib2F0IHJlY29yZCByZXN1bHQgc2VjdGlvbiBidWlsZGluZyBtb3VzZSBjYXNoIGNsYXNzIG5vdGhpbmcgcGVyaW9kIHBsYW4gc3RvcmUgdGF4IHNpZGUgc3ViamVjdCBzcGFjZSBydWxlIHN0b2NrIHdlYXRoZXIgY2hhbmNlIGZpZ3VyZSBtYW4gbW9kZWwgc291cmNlIGJlZ2lubmluZyBlYXJ0aCBwcm9ncmFtIGNoaWNrZW4gZGVzaWduIGZlYXR1cmUgaGVhZCBtYXRlcmlhbCBwdXJwb3NlIHF1ZXN0aW9uIHJvY2sgc2FsdCBhY3QgYmlydGggY2FyIGRvZyBvYmplY3Qgc2NhbGUgc3VuIG5vdGUgcHJvZml0IHJlbnQgc3BlZWQgc3R5bGUgd2FyIGJhbmsgY3JhZnQgaGFsZiBpbnNpZGUgb3V0c2lkZSBzdGFuZGFyZCBidXMgZXhjaGFuZ2UgZXllIGZpcmUgcG9zaXRpb24gcHJlc3N1cmUgc3RyZXNzIGFkdmFudGFnZSBiZW5lZml0IGJveCBmcmFtZSBpc3N1ZSBzdGVwIGN5Y2xlIGZhY2UgaXRlbSBtZXRhbCBwYWludCByZXZpZXcgcm9vbSBzY3JlZW4gc3RydWN0dXJlIHZpZXcgYWNjb3VudCBiYWxsIGRpc2NpcGxpbmUgbWVkaXVtIHNoYXJlIGJhbGFuY2UgYml0IGJsYWNrIGJvdHRvbSBjaG9pY2UgZ2lmdCBpbXBhY3QgbWFjaGluZSBzaGFwZSB0b29sIHdpbmQgYWRkcmVzcyBhdmVyYWdlIGNhcmVlciBjdWx0dXJlIG1vcm5pbmcgcG90IHNpZ24gdGFibGUgdGFzayBjb25kaXRpb24gY29udGFjdCBjcmVkaXQgZWdnIGhvcGUgaWNlIG5ldHdvcmsgbm9ydGggc3F1YXJlIGF0dGVtcHQgZGF0ZSBlZmZlY3QgbGluayBwb3N0IHN0YXIgdm9pY2UgY2FwaXRhbCBjaGFsbGVuZ2UgZnJpZW5kIHNlbGYgc2hvdCBicnVzaCBjb3VwbGUgZGViYXRlIGV4aXQgZnJvbnQgZnVuY3Rpb24gbGFjayBsaXZpbmcgcGxhbnQgcGxhc3RpYyBzcG90IHN1bW1lciB0YXN0ZSB0aGVtZSB0cmFjayB3aW5nIGJyYWluIGJ1dHRvbiBjbGljayBkZXNpcmUgZm9vdCBnYXMgaW5mbHVlbmNlIG5vdGljZSByYWluIHdhbGwgYmFzZSBkYW1hZ2UgZGlzdGFuY2UgZmVlbGluZyBwYWlyIHNhdmluZ3Mgc3RhZmYgc3VnYXIgdGFyZ2V0IHRleHQgYW5pbWFsIGF1dGhvciBidWRnZXQgZGlzY291bnQgZmlsZSBncm91bmQgbGVzc29uIG1pbnV0ZSBvZmZpY2VyIHBoYXNlIHJlZmVyZW5jZSByZWdpc3RlciBza3kgc3RhZ2Ugc3RpY2sgdGl0bGUgdHJvdWJsZSBib3dsIGJyaWRnZSBjYW1wYWlnbiBjaGFyYWN0ZXIgY2x1YiBlZGdlIGV2aWRlbmNlIGZhbiBsZXR0ZXIgbG9jayBtYXhpbXVtIG5vdmVsIG9wdGlvbiBwYWNrIHBhcmsgcGxlbnR5IHF1YXJ0ZXIgc2tpbg==")).Split($null)
    }
    process {
        $rnd = Get-Random -Minimum 0 -Maximum 10000
        $adj = $adjectives| Get-Random
        $noun = $second = $nouns | Get-Random
        $verb = $verbs | Get-Random
        if ($XKCD) { 
            $full_list = $adjectives + $nouns + $verbs; 
            return "$($full_list | Get-Random) $($full_list | Get-Random) $($full_list | Get-Random) $($full_list | Get-Random)" 
        }
        if ($FullPhrase)   { return "$adj $noun $verb" }
        if ($rnd -gt 5000) { return "$adj $noun" }
        return "$adj $verb"
    }
}
