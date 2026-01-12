# Terra: Footstep Analysis and Classification

This repository contains the implementation and data processing pipeline for footstep analysis and classification research. The project focuses on processing footstep data, extracting features, and generating spectrograms for classification purposes.

## Project Structure

```
.
├── event_detection/     # Event detection algorithms and processing
├── Demographic Details/ # Demographic information and metadata
├── specmeaker.py       # Spectrogram generation and signal processing
├── requirements.txt    # Python package dependencies
└── README.md           # Project documentation
```

## Prerequisites

- MATLAB R2022b (for initial data processing)
- Python 3.9.13
- Required Python packages (see requirements.txt):
  - numpy>=1.21.0
  - pandas>=1.3.0
  - PyWavelets>=1.2.0
  - matplotlib>=3.4.0
  - scipy>=1.7.0
  - torch>=1.9.0
  - torchvision>=0.10.0

## Data Processing Pipeline

### 1. Initial Data Processing (MATLAB)
- Load and process raw footstep data
- Extract features and create the `footstep_feat` variable
- Save processed data in `.mat` format with the following structure:
  - Last column: Labels (participant IDs)
  - Other columns: Feature vectors

### 2. Feature Extraction and Visualization
- Process the footstep features
- Generate visualizations of:
  - Processed data
  - Feature distributions
  - Clustering results

### 3. Spectrogram Generation
To use `specmeaker.py`, please create a virtual environment and install the dependencies there:

For Windows
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt

For macOS / Linux
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

The `specmeaker.py` script performs the following operations:

#### Data Loading and Preprocessing
- Loads the `.mat` file containing footstep features
- Extracts feature vectors and labels
- Optionally concatenates multiple footsteps into single samples

#### Continuous Wavelet Transform (CWT)
- Applies CWT to each footstep signal
- Uses Morlet wavelet ('morl') by default
- Generates spectrograms with scales from 1 to 256

#### Output Generation
- Creates class-specific directories for output
- Saves spectrogram images in PNG format
- Uses 'jet' colormap for visualization
- Maintains transparent background for better integration

## Dataset Pre-processing Steps

### Step 1: Dataset Creation
1. Open MATLAB and navigate to the `DatasetCreation.m` file
2. Uncomment the `persons` array to you want to use (line 9 - 41).
3. Run the `DatasetCreation.m` file
4. When prompted, select the folder containing the dataset files (P1, P2, etc.)
5. The script will:
   - Concatenate each person's first 4 .mat files into a single file (e.g., P1_all.mat)
   - Save the new files in the root folder
   - Continue this process for all persons in the array

### Step 2: Event Detection and Feature Extraction
1. Open the `main.m` file in MATLAB
2. Ensure all dependent files are in the same directory:
   - Event_Extract.m
   - GMM_EM.m
   - Other required function files
3. Select one person's file (e.g., P1_all.mat) as a reference for event extraction (line 7).
4. Modify the `persons` array to match your dataset (line 102)
5. Run the `main.m` file:
   - When prompted in line 14, select the Curve Fitting Toolbox
   - When prompted in line 43, select the Signal Processing Toolbox
   - When prompted in line 52, select the Statistics and Machine Learning Toolbox
   - It will display the smooth vibrational signal of the reference person
   - Show 2 clusters formed using the signal
   - Prompt you to press Enter in the MATLAB command window
   - Process the entire dataset (may take 2-7 hours depending on dataset size and hardware)


### Step 3: Event Concatenation
1. Open the `EventConcatenate.m` file in MATLAB
2. Load the path of the newly saved DatasetName_VariableName.mat file
3. Modify the loop iteration value in line 17 to match the number of persons in your dataset 
4. Run the `EventConcatenate.m` file
5. The output file is ready for use in machine learning and deep learning algorithms

## Usage

1. **Data Preparation**
   - Ensure MATLAB is installed
   - Prepare your footstep data files
   - Process data using MATLAB scripts to generate `footstep_feat`

2. **Feature Extraction**
   - Run MATLAB scripts to extract and save features
   - Verify the generated `.mat` file

3. **Spectrogram Generation**
   - Install Python dependencies:
     ```bash
     pip install -r requirements.txt
     ```
   - Update the configuration in `specmeaker.py`:
     ```python
     file_path = 'path_to_your_footstep_feat.mat'
     output_path = 'path_to_output_directory'
     footsteps_num = 1  # Number of footsteps to concatenate
     ```
   - Run the script:
     ```bash
     python specmeaker.py
     ```

## Results

The processed data and generated spectrograms are organized by class labels in the output directory. Each spectrogram represents the wavelet transform of the footstep signals, providing a time-frequency representation of the data. The output structure is:

```
output_path/
├── 0/                  # Class 0 samples
│   ├── cwt_image_0_0.png
│   ├── cwt_image_0_1.png
│   └── ...
├── 1/                  # Class 1 samples
│   ├── cwt_image_1_0.png
│   ├── cwt_image_1_1.png
│   └── ...
└── ...
```

## Citation

If you use this code in your research, please cite our paper:
[Paper citation information to be added]

<!-- ## License

[License information to be added] -->

<!-- ## Contact

[Contact information to be added] -->
