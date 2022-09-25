using UnityEngine;
using UnityEngine.InputSystem;

namespace _Game.Scripts.Gameplay
{
    [RequireComponent(typeof(PlayerInput))]
    public class PlayerConveyorControl : MonoBehaviour
    {
        [SerializeField] private InputActionReference _leftButton;
        [SerializeField] private InputActionReference _centerButton;
        [SerializeField] private InputActionReference _rightButton;
        [SerializeField] private ConveyorInput _conveyorInput;

        private PlayerInput _playerInput;

        void Awake()
        {
            _playerInput = GetComponent<PlayerInput>();
            _playerInput.onActionTriggered += OnAction;
        }

        private void OnAction(InputAction.CallbackContext obj)
        {
            var action = obj.action;
            if (action == _leftButton.action)
            {
                if (obj.started)
                {
                    _conveyorInput.PressLeft();
                }
                else if(obj.canceled)
                {
                    _conveyorInput.ReleaseLeft();
                }
            }

            if (action == _centerButton.action)
            {
                if (obj.started)
                {
                    _conveyorInput.PressCenter();
                }
                else if(obj.canceled)
                {
                    _conveyorInput.ReleaseCenter();
                }
            }

            if (action == _rightButton.action)
            {
                if (obj.started)
                {
                    _conveyorInput.PressRight();
                }
                else if(obj.canceled)
                {
                    _conveyorInput.ReleaseRight();
                }
            }
        }
    }
}