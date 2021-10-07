[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

# found some major issues, do not use script it's being fixed
<br />
<p align="center">
  <a href="https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/">
    <img src="images/logo.jpeg" alt="Logo" width="80" height="80">
  </a> 

<h3 align="center">Interpolating 160 channel cap data to 64 channels both directions</h3>

<h4 align="center">This project is a function that interpolates data from a 160 channel data set into a 64 channel data set or interpolates from 64 to a 160. There is a landmark option; this allows you to keep the channels that are the same from the original data set.</h4>


**Table of Contents**
  
1. [About the project](#about-the-project)
    - [Built With](#built-with)
2. [Getting started](#getting-started)
    - [Prerequisites](#prerequisites)  
3. [Usage](#usage)
    - [From 160 to 64 VS. from 64 to 160](#from-160-to-64-vs.-from-64-to-160)
    - [EEGlab structures](#eeglab-structures)
3. [ERPs](#erps)
3. [License](#license)
3. [Contact](#contact)
3. [Acknowledgement](#acknowledgement)





<!-- ABOUT THE PROJECT -->
## About The Project

transform_channels() - transform x amount of channel data into different amount of channels using the interpolation function of EEGlab or keeping the channels that are closest to the original channels. By comparing the location on both caps. 

```matlab
Usage: EEGOUT = transform_channels(EEG,chanlocs_new,n_new_chan,methode);
``` 
**Inputs:** 
  *EEG*             -   EEGLAB data set  
  *chanlocs_new*    -   chanlocs structure with amount of channels  
                        desired for EEG to be transformed to.  
  *n_new_chan*      -   64 or 160, this will decide what channels to keep  
  **Methods:**  
  *Interpolate*     -   This will interpolate all the channels from one configuration to the next
  *Keep*            -   This will keep all the original channels that are as close as possible to the equivalent channel of the new configuration.
**Output:**  
  *EEGOUT*          -   data set with the new amount of channels  

**Example:**  
``` EEG = transform_n_channels(EEG,EEG2.chanlocs,64,Keep);```

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

In short, you use the normal EEGlab function to load your data for "EEG". EEG2 is a data set (or only the chanlocs of a data set with the other amount of channels)
Then you use the function EEG = transform_n_channels(ORGEEG, newchan,n_new_chan, landmark)

```matlab
 EEG = pop_loadset('filename', '64.set', 'filepath', data_path);%loading participant file with 160 channels
 EEG2 = pop_loadset('filename', '160.set', 'filepath', data_path);%loading participant file with 64 channels
 EEG = transform_n_channels(EEG,EEG2.chanlocs,160, 'landmark');
```

### From 160 to 64 VS. from 64 to 160

You can use the function in both directions, one thing to keep in mind is that creating 64 channels out of 160 is using a lot of data to create less new channels, whereas the opposite is true when you go from 64 to 160. Always test the data still looks the way it should. When looking at topoplots it shows what happens.  
**In the first case we interpolate from 160 to 64 .** These are the original data before the function is run at 0ms and 100ms.  
![original 160](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/blob/main/images/original_160.jpg)  
This is the data after interpolating it to 64 channels  
![160 to 64 interpolation](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/blob/main/images/inter_160_inter.jpg)  
This is the same data when keeping the original channels to go to 64.  
![160 to 64 keeping channels](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/blob/main/images/keep_160.jpg)  

**IN the second case we interpolate from 64 to 160 channels.** 
![original 64](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/blob/main/images/original_64.jpg)  
This is the data after interpolating it to 160 channels  
![64 to 160 interpolation](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/blob/main/images/inter_64.jpg)  
This is the same data when keeping the original channels to go to 64.  
![64 to 160 keeping channels](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/blob/main/images/keep_64.jpg)  



### EEGlab structures

This function works within EEGlab, and only works on things inside the EEG structure. The main part of the script deals with the name and location of the channels, this would be in EEG.chanlocs.  
When it's done it also moves around the data in EEG.data. This is because for a 160ch setup, A1 is the first channel (meaning urchan = 1) whereas for a 64 channel setup FP1. The equivalent channel to A1 is Cz, this channel is the 48th channel.  


## ERPs
I have tested plotting ERPs but they are somewhat misleading. When looking at the ERPs using the 'keep' methode they are identical to the original data. This makes sense because they are identical. Whereas the 'interpolate' methode changes the ERP a little. Because of this there are no ERPs here. But you can see them [here](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/blob/main/images/)


### Please let me know if you have any suggestion on how to make this function better

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Douwe Horsthuis - [@douwejhorsthuis](https://twitter.com/douwejhorsthuis) - douwehorsthuis@gmail.com

Project Link: [https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/](https://github.com/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab/)


## Acknowledgements

* [Ana Francisco](https://github.com/anafrancisco)
* [Filip De Sanctis](https://github.com/pdesanctis)
* [Kevin Prinsloo](https://github.com/kevinprinsloo)
* [Seyda Tikir](https://github.com/tikirs)


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
