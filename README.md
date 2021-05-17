[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<br />
<p align="center">
  <a href="https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/">
    <img src="images/logo.jpeg" alt="Logo" width="80" height="80">
  </a> 

<h3 align="center">Interpolating 160 channel cap data to 64 channels both directions</h3>

<h4 align="center">This project is a function that interpolates data from a 160 channel data set into a 64 channel dataset or interpolates from 64 to a 160. There is a landmark option; this allows you to keep the channels that are the same from the original dataset.</h4>


**Table of Contents**
  
1. [About the project](#about-the-project)
    - [Built With](#built-with)
2. [Getting started](#getting-started)
    - [Prerequisites](#prerequisites)  
3. [Usage](#usage)
    - [From 160 to 64 VS. from 64 to 160](#from-160-to-64-vs.-from-64-to-160)
    - [Landmark channels VS. no landmark channels](#landmark-channels-vs.-no-landmark-channels)
3. [Further testing](#further-testing)
3. [License](#license)
3. [Contact](#contact)
3. [Acknowledgement](#acknowledgement)





<!-- ABOUT THE PROJECT -->
## About The Project

transform_channels() - transform x amount of channel data into different amount of channels using the interpolation function of EEGlab keeps the "landmark channels" that exist in both caps (Cz=A1 Pz=A19 Oz=A23 T8=B32 C4 =C7 Fz=D4 FPz=D8 C3=E4 T7=E9)

```matlab
Usage: EEGOUT = transform_channels(EEG,chanlocs_new,n_new_chan);
``` 
**Inputs:** 
  *EEG*             -   EEGLAB dataset  
  *chanlocs_new*    -   chanlocs stucture with amount of channels  
                        desired for EEG to be transformed to.  
  *n_new_chan*      -   64 or 160, this will decide what channels to keep  
**Optional Inputs:**  
  *landmarks*       -   adding this, the landmark channels will not be interpolated. This will only count for : Cz=A1 Pz=A19 Oz=A23 T8=B32 C4 =C7 Fz=D4 FPz=D8 C3=E4 T7=E9 when not adding this, all new channels will be interpolated. No landmark channels will be used.  
**Output:**  
  *EEGOUT*          -   dataset with the new amount of channels  

**Example:**  
``` EEG = transform_n_channels(EEG,EEG2.chanlocs,64);```

**Extra:**  
To get the EEG2.chanlocs with the new amount of channels,simply load an .set file with those amount of channels making sure that the channel info has been inputted

**Author:** Douwe Horsthuis, CNL Albert Einstein College of Medicine, 2021 douwehorsthuis@gmail.com

This function relies several [EEGLAB](https://sccn.ucsd.edu/eeglab/index.php) functions.


### Built With

* [Matlab](https://www.mathworks.com/)
* [EEGlab](https://sccn.ucsd.edu/eeglab/index.php)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

Software: You need to have a copy of [EEGlab](https://sccn.ucsd.edu/eeglab/download.php) (these scripts works for version eeglab2019_1)


<!-- USAGE EXAMPLES -->
## Usage
You can use the data and example in the testing folder. 

In short, you use the normal EEGlab function to load your data for "EEG". EEG2 is a dataset (or only the chanlocs of a dataset with the other amount of channels)
Then you use the function EEG = transform_n_channels(ORGEEG, newchan,n_new_chan, landmark)

```matlab
 EEG = pop_loadset('filename', '64.set', 'filepath', data_path);%loading participant file with 160 channels
 EEG2 = pop_loadset('filename', '160.set', 'filepath', data_path);%loading participant file with 64 channels
 EEG = transform_n_channels(EEG,EEG2.chanlocs,160, 'landmark');
```

### From 160 to 64 VS. from 64 to 160

You can use the function in both directions, one thing to keep in mind is that creating 64 channels out of 160 is using a lot of data to create less new channels, whereas the opossite is true when you go from 64 to 160. Always test the data still looks the way it should. 

### Landmark channels VS. no landmark channels

Landmark channels are channels that are the same for each cap. These are Cz=A1 Pz=A19 Oz=A23 T8=B32 C4 =C7 Fz=D4 FPz=D8 C3=E4 T7=E9. 
There are arguements to keep them and arguments to only use interpolated data. I've chosen as a default to go without using the landmark channels, because we are transforming all the channels. This might have an inpact on their amplitude. To make sure the data doesn't have outliers, I prefer to only use interpolated channels. 


## Further testing

To make sure this function works perfectly I will test the following
1.  How does an ERP look from the original cap vs interpolated
2.  How does a scalpmap look the original cap vs interpolated
3.  Is there a difference between a scalpmap and ERP from a landmark channels vs interpolated channel in the new data

### Please let me know if you have any suggestion on how to make this function better

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Douwe Horsthuis - [@douwejhorsthuis](https://twitter.com/douwejhorsthuis) - douwehorsthuis@gmail.com

Project Link: [https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/)


## Acknowledgements

* [Kevin Prinsloo](https://github.com/kevinprinsloo)
* [Pierfilippo De Sanctis](https://github.com/orgs/CognitiveNeuroLab/people/pdesanctis)
* [Ana Francisco](https://github.com/anafrancisco)


[contributors-shield]: https://img.shields.io/github/contributors/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[contributors-url]: https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[forks-url]: https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/network/members
[stars-shield]: https://img.shields.io/github/stars/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[stars-url]: https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/stargazers
[issues-shield]: https://img.shields.io/github/issues/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[issues-url]: https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/issues
[license-shield]: https://img.shields.io/github/license/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[license-url]: https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/douwe-horsthuis-725bb9188
