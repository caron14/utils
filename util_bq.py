import pandas as pd
import tqdm

from google.cloud import bigquery


def load_dataframe_from_bigquery(query: str) -> pd.DataFrame():
    client = bigquery.Client()
    # progress_bar_type: 'tqdm', 'tqdm_notebook', 'tqdm_gui'
    return client.query(query).to_dataframe(progress_bar_type='tqdm')


if __name__ == "__main__":
    pass