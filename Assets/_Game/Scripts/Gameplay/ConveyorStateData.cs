using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Gameplay
{
    public class ConveyorStateData : MonoBehaviour
    {
        [SerializeField] private UnityEvent<int> _onFailuresUpdated;
        [SerializeField] private UnityEvent<int> _onSuccessesUpdated;

        private int _failedWidgets;
        private int _successfulWidgets;

        void Awake()
        {
            _failedWidgets = 0;
            _successfulWidgets = 0;
        }
        
        public void OnWidgetFail()
        {
            _failedWidgets++;
            _onFailuresUpdated.Invoke(_failedWidgets);
        }
        
        public void OnWidgetSucceed()
        {
            _successfulWidgets++;
            _onSuccessesUpdated.Invoke(_failedWidgets);
        }
    }
}