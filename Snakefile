samples =["father", "mother", "proband"]

rule all: 
    input: 
        expand("mapped_reads/{sample}.bam", sample = samples)

rule bwa_map: 
    input:
        "ref/hg19_chr8.fa", 
        "fastq/{sample}_R1.fq.gz",
        "fastq/{sample}_R2.fq.gz"

    output:
        "mapped_reads/{sample}.bam"
    
    container: 
        "docker://alpine"

    shell:
        "bwa mem {input} | samtools view -Shb -o {output}"
