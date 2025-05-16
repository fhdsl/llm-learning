#!/bin/bash

# Check if output file argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <output_file.vcf>"
    exit 1
fi

output_file="$1"

# Find all VCF files in current directory
vcf_files=$(find . -name "*.vcf")

if [ -z "$vcf_files" ]; then
    echo "No VCF files found in current directory"
    exit 1
fi

# Print sample names from each VCF file
echo "Sample names in VCF files:"
for vcf in $vcf_files; do
    echo "File: $vcf"
    bcftools query -l "$vcf"
    echo "-------------------"
done

# Merge VCF files
echo "Merging VCF files..."
bcftools merge $vcf_files -o "$output_file"

if [ $? -eq 0 ]; then
    echo "Successfully merged VCF files to: $output_file"
    echo "Merged file contains these samples:"
    bcftools query -l "$output_file"
else
    echo "Error merging VCF files"
    exit 1
fi