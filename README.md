[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<br />
<p align="center">
  <a href="https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/">
    <img src="images/logo.jpeg" alt="Logo" width="80" height="80">
  </a> 

<h3 align="center">Transforming data and structures between 160 channel cap and 64 channels</h3>

<h4 align="center">This project is a function that transforms data between 160 channel data sets and 64 channel data sets. There are 2 ways of doing this, one is via interpolation and one is via keeping channels that have the same approximate distance the the new channels. The whole function is build so that it works within the EEGlab structure.</h4>


**Table of Contents**
  
1. [About the project](#about-the-project)
    - [Built With](#built-with)
2. [Getting started](#getting-started)
    - [Prerequisites](#prerequisites)  
3. [Usage](#usage)
    - [Caps](#caps)
    - [From 160 to 64 VS. from 64 to 160](#from-160-to-64-vs.-from-64-to-160)
    - [Two different methodes](#two-different-methodes)
    - [EEGlab structures](#eeglab-structures)
3. [Testing the function](#testing-the-function)
    - [ERPS](#erps)
    - [Scalpmaps](#scalpmaps)
3. [Future steps](#future-steps)
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
### Caps  
Important to note is that this function is made to be used one Bio-semi caps. For now it uses the locations of a 64channels cap with a 10-20 system layout and a 160 channel cap with a ABC layout. For more info on these differences see [the biosemi website](https://www.biosemi.com/headcap.htm)  

### Two different methods  

The function uses two different methods. Either it interpolates all the channels or it keeps the channel that are the as close as possible between the original and the new data and adds/takes the remaining channels depending on if you go from 160-->64 or 64-->160.
**Interpolate method**
This method makes sure that the new data has the same channel locations as other 64 channel data. Because the 160 channel cap does not follow the 10-20 layout rule none of the channels are kept. Instead it uses the original data to interpolate as many channels as the new data set needs to have. It uses the different channel locations in the EEG.chanloc structure to figure this out. 
Pros:
1. if you don't have all the channels (you deleted a bad channel) this will still work.
2. your new data channels will have the exact same coordinates as the rest of your data. 
Cons:
1. all the data is interpolated. This might be something that for example ICA does not deal well with. 

**Keep method**  
This method makes sure that the original data is not interpolated, instead it only uses interpolation if needed to create extra channels when you go from 64-->160. It keeps the channel locations of the original data, which will be slightly different but it doesn't touch the EEG data, so this is still the same. 
1. As many channels as possible are not altered. This means that the data should be perfect for ICA for example.
Cons:
1. Since not all of the channels have an channel on the other layout with the exact same coordinates, the data less good spacial.
2. if your original data is missing channels, it might be a problem to use this.Because you would need to interpolate the data before to get these channels.

### From 160 to 64 VS. from 64 to 160

You can use the function in both directions, one thing to keep in mind is that creating 64 channels out of 160 is using a lot of data to create less new channels, whereas the opposite is true when you go from 64 to 160. Always test the data still looks the way it should. When looking at topoplots it shows what happens.  
**In the first case we interpolate from 160 to 64 .** These are the original data before the function is run at 0ms and 100ms.  
![original 160](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/original_160.jpg)  
This is the data after interpolating it to 64 channels  
![160 to 64 interpolation](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/inter_160_inter.jpg)  
This is the same data when keeping the original channels to go to 64.  
![160 to 64 keeping channels](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/keep_160.jpg)  

**IN the second case we interpolate from 64 to 160 channels.**  

![original 64](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/original_64.jpg)   
This is the data after interpolating it to 160 channels  
![64 to 160 interpolation](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/inter_64.jpg)  
This is the same data when keeping the original channels to go to 64.  
![64 to 160 keeping channels](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/keep_64.jpg)  

### EEGlab structures

This function works within EEGlab, and only works on things inside the EEG structure. The main part of the script deals with the name and location of the channels, this would be in EEG.chanlocs.  
When it's done it also moves around the data in EEG.data. This is because for a 160ch setup, A1 is the first channel (meaning urchan = 1) whereas for a 64 channel setup FP1. The equivalent channel to A1 is Cz, this channel is the 48th channel.  
  
  
## Testing the function    

### ERPs  

I have tested plotting ERPs but they are somewhat misleading. When looking at the ERPs using the 'keep' method they are identical to the original data. This makes sense because they are identical. Whereas the 'interpolate' method changes the ERP a little. Because of this there are no ERPs here. But you can see them [here](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/)

### Scalpmaps  
![before 64](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/64_chan_before.gif){:height="50%" width="50%"} ![interpolate 64 to 160](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/64_chan_inter.gif){:height="150px" width="150px"} ![keep 64 to 160](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/64_chan_keep.gif | width=150)
<img src="https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/main/images/64_chan_keep.gif" width="150" height="150">
  
### Future steps  
Ideally we want to test this funtion on a group of datasets to see if there is an issue and if it changes the data in a significant way.  
 
### Please let me know if you have any suggestion on how to make this function better or if you want to help and update the function to include more cap sizes

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Douwe Horsthuis - [@douwejhorsthuis](https://twitter.com/douwejhorsthuis) - douwehorsthuis@gmail.com

Project Link: [https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/](https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/)


## Acknowledgements

* [Ana Francisco](https://github.com/anafrancisco)
* [Filip De Sanctis](https://github.com/pdesanctis)
* [Kevin Prinsloo](https://github.com/kevinprinsloo)
* [Seyda Tikir](https://github.com/tikirs)


[contributors-shield]: https://img.shields.io/github/contributors/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[contributors-url]: https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[forks-url]: https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/network/members
[stars-shield]: https://img.shields.io/github/stars/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[stars-url]: https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/stargazers
[issues-shield]: https://img.shields.io/github/issues/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[issues-url]: https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/issues
[license-shield]: https://img.shields.io/github/license/DouweHorsthuis/Interpolating_160ch_to_64ch_eeglab.svg?style=for-the-badge
[license-url]: https://github.com/DouweHorsthuis/Interpolating-channels-between-different-cap-sizes/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/douwe-horsthuis-725bb9188

