using Sirenix.OdinInspector;
using TMPro;
using UnityEngine;

namespace _Game.Scripts.Characters
{
    public class CharacterIconController : MonoBehaviour
    {
        [OnValueChanged("SetupCharacterEditor")] [SerializeField]
        private CharacterSO _character;

        private SpriteRenderer _spriteRenderer;
        private TextMeshPro _textMeshPro;

        void Awake()
        {
            _spriteRenderer = GetComponentInChildren<SpriteRenderer>();
            _textMeshPro = GetComponentInChildren<TextMeshPro>();
        }

        void Start()
        {
            SetupCharacter();
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
                // if (_character.CharacterIconMaterial)
                // {
                //     _spriteRenderer.material = _character.CharacterIconMaterial;
                // }
            }
        }
    }
}