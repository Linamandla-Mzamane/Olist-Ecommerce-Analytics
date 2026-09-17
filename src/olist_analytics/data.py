from pathlib import Path

import kagglehub

from olist_analytics.config import (OLIST_DATASET,
                                    RAW_CSV_FILES,
                                    RAW_DATA_DIR)


def download_dataset() -> Path:
    """Download the Olist e-commerce csv files from Kaggle into data/raw/.

    If the files are already in the folder they won't be downloaded again.

    :return: Path to the data/raw/ directory.
    """
    RAW_DATA_DIR.mkdir(parents=True, exist_ok=True)
    kagglehub.dataset_download(
        handle=OLIST_DATASET,
        output_dir=str(RAW_DATA_DIR)
    )

    return RAW_DATA_DIR


def missing_raw_files() -> list[str]:
    """List the raw csv files that are supposed to be in data/raw/.
    but are not.

    :return: Filenames from RAW_CSV_FILES that are missing. If the
    list is empty then the download is complete.
    """
    missing_files = []
    for name in RAW_CSV_FILES:
        file_path = RAW_DATA_DIR / name
        if not file_path.exists():
            missing_files.append(name)

    return missing_files