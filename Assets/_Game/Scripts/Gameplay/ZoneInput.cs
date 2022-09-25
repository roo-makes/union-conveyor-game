using System;
using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Gameplay
{
    public class ZoneInput : MonoBehaviour
    {
        [SerializeField] private UnityEvent _buttonPressed;
        [SerializeField] private UnityEvent _buttonReleased;
        [SerializeField] private ZonePosition _zonePosition;

        private ConveyorInput _conveyorInput;

        void Awake()
        {
            _conveyorInput = GetComponentInParent<ConveyorInput>();
        }

        private void OnEnable()
        {
            if (_conveyorInput == null) return;
            switch (_zonePosition)
            {
                case ZonePosition.Left:
                    _conveyorInput.LeftZonePress += OnPress;
                    _conveyorInput.LeftZoneRelease += OnRelease;
                    break;
                case ZonePosition.Center:
                    _conveyorInput.CenterZonePress += OnPress;
                    _conveyorInput.CenterZoneRelease += OnRelease;
                    break;
                case ZonePosition.Right:
                    _conveyorInput.RightZonePress += OnPress;
                    _conveyorInput.RightZoneRelease += OnRelease;
                    break;
            }
        }

        private void OnPress()
        {
            _buttonPressed.Invoke();
        }
        
        private void OnRelease()
        {
            _buttonReleased.Invoke();
        }
    }

    public enum ZonePosition
    {
        Left, Center, Right
    }
}