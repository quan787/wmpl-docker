FROM python:3.10-bullseye

RUN apt-get update \
    && apt-get -y install libgl1 \
    && pip install numpy scipy matplotlib cython pytz pyqt5 pandas \
    && pip install jplephem ephem \
    && pip install watchdog \
    # && pip install numba \
    && pip install basemap basemap-data-hires

WORKDIR /root

RUN git clone --recursive https://github.com/wmpg/WesternMeteorPyLib.git

WORKDIR /root/WesternMeteorPyLib

RUN python setup.py install \
    && python -m wmpl.Trajectory.Trajectory
