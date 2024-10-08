all: DataPreperation DataExploration Analysis

DataPreperation:
	make -C src/DataPreparation

DataExploration:
	make -C src/DataExploration

Analysis: DataPreperation
	make -C src/Analysis

clean:
	R -e "unlink('data', recursive = TRUE)"
	R -e "unlink('gen', recursive = TRUE)"