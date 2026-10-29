variable "ospf_reference_bandwidth" {
  description = "OSPF auto-cost reference-bandwidth (Mbps), applied identically to every area 0 router so interface costs stay consistent and Terraform can detect/remediate drift if it's changed out-of-band."
  type        = number
  default     = 100000
}
