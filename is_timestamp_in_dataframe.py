from typing import Optional, Tuple

import numpy as np
import pandas as pd


def create_sample_dataframe(ts_col, value_col, start_ts, end_ts, freq):
    # サンプルの時系列データを作成
    date_rng = pd.date_range(start=start_ts, end=end_ts, freq=freq)
    df = pd.DataFrame(date_rng, columns=[ts_col])
    df[value_col] = np.array([1] * len(date_rng))  # range(len(date_rng))
    return df


def is_timestamp_in_df(
    timestamp: str,
    df: pd.DataFrame,
    ts_col: str,
) -> bool:
    """
    Judge whether the timestamp is included
    in the data frame period.

    Args:
        timestamp: str
            target timestamp
        df: pd.DataFrame
            timeseries dataframe
        ts_col: str
            column name for timeseries

    Return:
        bool, judgement
    """
    timestamp = pd.to_datetime(timestamp)
    return (df[ts_col].min() <= timestamp) & (timestamp <= df[ts_col].max())


def slice_df_on_specified_timeseries(
    df: pd.DataFrame,
    ts_col: str,
    start_ts: pd.Timestamp,
    end_ts: pd.Timestamp,
) -> pd.DataFrame:
    """
    Slice the dataframe on the specified period

    Args:
        df: pd.DataFrame
            timeseries dataframe
        ts_col: str
            column name for timeseries
        start_ts: str
            timestamp for start of the period
        end_ts: str
            timestamp for start of the period

    Return:
        pd.DataFrame, sliced dataframe
    """
    if type(start_ts) != pd.Timestamp or type(end_ts) != pd.Timestamp:
        start_ts, end_ts = pd.to_datetime(start_ts), pd.to_datetime(end_ts)
    return df.loc[(df[ts_col] >= start_ts) & (df[ts_col] <= end_ts)].reset_index(
        drop=True
    )


def normarize_on_specified_period(
    df: pd.DataFrame,
    ts_col: str,
    value_col: str,
    start_ts: str,
    end_ts: str,
) -> Tuple[pd.DataFrame, float]:
    """
    Normalize the values during the specified period

    Args:
        df: pd.DataFrame
            timeseries dataframe
        ts_col: str
            column name for timeseries
        value_col: str
            column name for target values
        start_ts: str
            timestamp for start of the period
        end_ts: str
            timestamp for start of the period

    Returns:
        df: pd.DataFrame
            updated dataframe
        sum_values: float
            summation values for normalization
    """
    start_ts, end_ts = pd.to_datetime(start_ts), pd.to_datetime(end_ts)
    sliced_df = slice_df_on_specified_timeseries(df, ts_col, start_ts, end_ts)

    sum_values = sum(sliced_df[value_col])
    sliced_df[value_col] /= sum_values

    # Update the values on specified period
    df.loc[(df[ts_col] >= start_ts) & (df[ts_col] <= end_ts), value_col] = np.array(sliced_df[value_col])

    return df, sum_values


if __name__ == "__main__":
    ts_col, value_col = "date", "value"
    start_ts, end_ts, freq = "2022-01-01", "2022-12-31", "D"
    df = create_sample_dataframe(ts_col, value_col, start_ts, end_ts, freq)
    print(df)

    # Test `is_timestamp_in_df()`
    test_timestamp = "2022-08-10"
    assert True == is_timestamp_in_df(test_timestamp, df, ts_col)

    # Test `slice_df_on_specified_timeseries`
    start_ts, end_ts = "2022-10-06", "2022-10-15"
    assert list(pd.date_range(start=start_ts, end=end_ts, freq="D")) == list(
        slice_df_on_specified_timeseries(df, ts_col, start_ts, end_ts)[ts_col]
    )

    # Test
    start_ts, end_ts = "2022-12-26", "2022-12-30"  # 5 days
    df, sum_values = normarize_on_specified_period(df, ts_col, value_col, start_ts, end_ts)
    print(df)
    assert sum_values == 5
