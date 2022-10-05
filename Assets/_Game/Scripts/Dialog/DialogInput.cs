using System.Linq;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.InputSystem;

namespace _Game.Scripts.Dialog
{
    public class DialogInput : MonoBehaviour
    {
        [SerializeField] private InputActionAsset _inputActionAsset;
        private InputActionMap _dialogMap;

        [SerializeField] private UnityEvent OnLeftPress;
        [SerializeField] private UnityEvent OnRightPress;
        [SerializeField] private UnityEvent OnUpPress;
        [SerializeField] private UnityEvent OnDownPress;

        void Awake()
        {
            _dialogMap = _inputActionAsset.actionMaps.First(map => map.name == "Dialog");
        }
        
        void Start()
        {
            _dialogMap.Enable();
            _dialogMap.actionTriggered += InputPerformed;
        }

        void OnDisable()
        {
            _dialogMap.actionTriggered -= InputPerformed;
            _dialogMap.Disable();
        }
        
        void InputPerformed(InputAction.CallbackContext obj)
        {
            if (obj.performed)
            {
                switch (obj.action.name)
                {
                    case "Option L":
                        OnLeftPress.Invoke();
                        break;
                    case "Option R":
                        OnRightPress.Invoke();
                        break;
                    case "Option U":
                        OnUpPress.Invoke();
                        break;
                    case "Option D":
                        OnDownPress.Invoke();
                        break;
                }
            }
        }
    }
}