using HutongGames.PlayMaker;
using UnityEngine;
using UnityEngine.Events;

namespace _Game.Scripts.Gameplay
{
    public class WidgetStateData : MonoBehaviour
    {
        [SerializeField] private bool _needsSanitization;
        [SerializeField] private bool _needsFilling;
        [SerializeField] private int _dropsNeeded;
        
        private bool _isSanitized = false;
        private int _numDrops = 0;
        private float _fillPercent;

        [SerializeField] private UnityEvent WidgetReset;
        [SerializeField] private UnityEvent WidgetSanitized;
        [SerializeField] private UnityEvent WidgetStartFill;
        [SerializeField] private UnityEvent WidgetFilled;
        [SerializeField] private UnityEvent<int> WidgetDrop;
        [SerializeField] private UnityEvent WidgetDroppered;
        
        public bool IsFilled => FillPercent >= 1;
        public bool IsSanitized => _isSanitized;
        public float FillPercent => _fillPercent;
        public int NumDrops => _numDrops;
        public int TotalDrops => _dropsNeeded;
        public bool IsDroppered => NumDrops == TotalDrops;

        public void Reset()
        {
            _isSanitized = !_needsSanitization;
            _fillPercent = _needsFilling ? 0f : 1f;
            _numDrops = 0;
            WidgetReset.Invoke();
        }

        public void Sanitize()
        {
            if (!_isSanitized)
            {
                _isSanitized = true;
                WidgetSanitized.Invoke();
            }
        }

        public void AddFill(float amount)
        {
            if (FillPercent == 0f && amount > 0f) WidgetStartFill.Invoke();

            _fillPercent += amount;
            
            if (IsFilled) WidgetFilled.Invoke();
        }

        public void AddDrop()
        {
            if (NumDrops >= TotalDrops) return;

            _numDrops++;

            WidgetDrop.Invoke(NumDrops);
            if(NumDrops == TotalDrops) {
                WidgetDroppered.Invoke();
            }
        }
    }
}