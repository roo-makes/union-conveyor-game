using System;
using Sirenix.OdinInspector;
using UnityEngine;

namespace _Game.Scripts.Gameplay
{
    public class ConveyorInput : MonoBehaviour
    {
        public event Action LeftZonePress;
        public event Action LeftZoneRelease;
        public event Action CenterZonePress;
        public event Action CenterZoneRelease;
        public event Action RightZonePress;
        public event Action RightZoneRelease;

        [ReadOnly] public bool LeftZoneIsPressed;
        [ReadOnly] public bool CenterZoneIsPressed;
        [ReadOnly] public bool RightZoneIsPressed;

        void Awake()
        {
            LeftZoneIsPressed = false;
            CenterZoneIsPressed = false;
            RightZoneIsPressed = false;
        }

        public void PressLeft()
        {
            LeftZoneIsPressed = true;
            LeftZonePress?.Invoke();
        }

        public void ReleaseLeft()
        {
            LeftZoneIsPressed = false;
            LeftZoneRelease?.Invoke();
        }

        public void PressCenter()
        {
            CenterZoneIsPressed = true;
            CenterZonePress?.Invoke();
        }

        public void ReleaseCenter()
        {
            CenterZoneIsPressed = false;
            CenterZoneRelease?.Invoke();
        }

        public void PressRight()
        {
            RightZoneIsPressed = true;
            RightZonePress?.Invoke();
        }

        public void ReleaseRight()
        {
            RightZoneIsPressed = false;
            RightZoneRelease?.Invoke();
        }
    }
}