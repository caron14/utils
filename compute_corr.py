def compute_correlation_np(
    df: pd.DataFrame,
    col1: str,
    col2: str,
    window: int = 7,
    date_col: str = 'index',
):
    """
    Args:
        window: int
            window size
    """
    if date_col == 'index':
        start_dt, end_dt = df.index.min(), df.index.max()
    else:
        start_dt, end_dt = df[date_col].min(), df[date_col].max()

    corr_list = [0] * window
    for i in range(len(df) - window):
        data1 = df.loc[i:i + window, col1].to_numpy(dtype=np.float32).reshape(-1)
        data2 = df.loc[i:i + window, col2].to_numpy(dtype=np.float32).reshape(-1)
        corr = np.corrcoef(data1, data2)
        corr_list.append(corr[0][1])

    assert len(corr_list) == len(df)

    return np.array(corr_list, dtype=float)


def compute_correlation_pd(
    df: pd.DataFrame,
    col1: str,
    col2: str,
    window: int = 7,
    date_col: str = 'index',
):
    """
    Args:
        window: int
            window size
    """
    if date_col == 'index':
        start_dt, end_dt = df.index.min(), df.index.max()
    else:
        start_dt, end_dt = df[date_col].min(), df[date_col].max()

    df['corr'] = df[col1].rolling(window=window).corr(df[col2])
    # display(df[['corr', col1, col2]].head(10))

    return df['corr'].to_numpy()


if __name__ == "__main__":
    col1, col2 = 'col1', 'col2'
    _df['corr'] = compute_correlation_pd(_df, col1, col2, window=28)

    _df.set_index('DATE', inplace=True)
    col_list = [col1, col2]

    fig, ax = plt.subplots(2, 1, figsize=(8, 6))
    for col in col_list:
        _df[col].plot(label=col, ax=ax[0])
    _df['corr'].plot(label='corr', ax=ax[1])
    plt.show()