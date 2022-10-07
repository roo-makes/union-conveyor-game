using _Framework;
using DG.Tweening;
using Sirenix.OdinInspector;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;

namespace _Game.Scripts.Characters
{
    public class CharacterIconController : MonoBehaviour
    {
        [OnValueChanged("SetupCharacterEditor")] [SerializeField]
        private CharacterSO _character;

        [SerializeField] private FloatVariable _characterTalkMoveYRange;
        [SerializeField] private FloatVariable _characterTalkMoveYFreq;

        private SpriteRenderer _spriteRenderer;
        private TextMeshPro _textMeshPro;
        private Tween _talkingTween;

        private float _startY;

        void Awake()
        {
            _spriteRenderer = GetComponentInChildren<SpriteRenderer>();
            _textMeshPro = GetComponentInChildren<TextMeshPro>();
        }

        void Start()
        {
            SetupCharacter();
            _startY = _spriteRenderer.gameObject.transform.localPosition.y;
            _character.StartedTalking += StartTalking;
            _character.StoppedTalking += StopTalking;
        }

        void OnDisable()
        {
            if (_talkingTween != null)
            {
                _talkingTween.Kill();
            }

            _character.StartedTalking += StartTalking;
            _character.StoppedTalking += StopTalking;
        }

        void SetupCharacterEditor()
        {
            var _spriteRenderer = GetComponentInChildren<SpriteRenderer>();
            var _textMeshPro = GetComponentInChildren<TextMeshPro>();
            _textMeshPro.text = _character.IsPlayer ? "YOU" : _character.Name;
            _spriteRenderer.color = _character.CharacterIconColor;
        }

        void SetupCharacter()
        {
            if (_character != null)
            {
                _textMeshPro.text = _character.IsPlayer ? "YOU" : _character.Name;
                _spriteRenderer.color = _character.CharacterIconColor;
            }
        }

        public void StartTalking()
        {
            if (_spriteRenderer == null) return;
            _talkingTween = _spriteRenderer.transform.DOLocalMoveY(_startY + _characterTalkMoveYRange.Value,
                    _characterTalkMoveYFreq.Value / 2)
                .SetLoops(-1, LoopType.Yoyo);
        }

        public void StopTalking()
        {
            if (_spriteRenderer == null) return;
            _talkingTween.Kill();
            _spriteRenderer.transform.DOLocalMoveY(_startY, _characterTalkMoveYFreq.Value / 2);
        }
    }
}