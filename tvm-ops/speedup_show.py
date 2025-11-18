import pandas as pd
from plotnine import ggplot, aes, geom_bar, geom_line, labs, theme_minimal
from plotnine.scales import scale_y_log10
from plotnine import facet_wrap

# Read the CSV file
data = pd.read_csv('./overhead_results_31.csv')

# Filter data for computation-heavy kernels
kernels = ['conv', 'matmul', 'gemm', 'batch_norm']
filtered_data = data[data['label'].isin(kernels)]

# Compute speedup (fix SettingWithCopyWarning)
filtered_data = filtered_data.copy()
filtered_data['speedup'] = filtered_data['avg_dynm_exec_ns'] / filtered_data['avg_symb_exec_ns']

# Create the plot with bars and subfigures for each label
plot = (
    ggplot(filtered_data, aes(x='factor(size)', y='speedup')) +
    geom_bar(stat='identity') +
    scale_y_log10() +
    labs(
        title='Speedup of Symbolic over PGO',
        x='Input Size',
        y='Speedup (Log Scale)'
    ) +
    facet_wrap('~label', scales='free_y') +
    theme_minimal()
)

# Save the plot
plot.save('./speedup.pdf')