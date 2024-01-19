import gdal
import csv

# Input and output file paths
csv_file = 'C:\Workspace\dol-workshop-back-end\data-1705586815390.csv'
tiff_file = 'C:\Workspace\dol-workshop-back-end\data-1705586815390.tif'

# Read CSV and extract TIFF data
with open(csv_file, 'r') as csvfile:
    reader = csv.reader(csvfile)
    next(reader)  # Skip header
    tiff_data = [row[0] for row in reader]

# Write TIFF data to a new GeoTIFF file
gdal_array = gdal.Open(tiff_data[0], gdal.GA_ReadOnly)
driver = gdal.GetDriverByName('GTiff')
output_dataset = driver.CreateCopy(tiff_file, gdal_array)
output_dataset = None
